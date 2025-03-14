#!/usr/bin/env python3

import json
import subprocess
import sys
from typing import Literal, TypedDict


def main():
    match sys.argv[1:]:
        case ["--current-output-name", *_]:
            workspace_name = get_current_niri_workspace_name()
            print(workspace_name, flush=True)
        case ["--listen-workspaces", *_]:
            listen_workspaces_data()
        case _:
            raise ValueError(f"You should provide mode!\nCheck: {__file__}")


def get_current_niri_workspace_name() -> str:
    curr_workspace_data = json.loads(
        subprocess.check_output(
            [
                "niri",
                "msg",
                "-j",
                "focused-output",
            ]
        ).decode("utf-8")
    )
    return curr_workspace_data["name"]


Output = str


def listen_workspaces_data() -> None:
    process = subprocess.Popen(
        ["niri", "msg", "event-stream"],
        stdout=subprocess.PIPE,
    )
    if process.stdout is None:
        print("Error: could not `niri msg event-stream`")
        exit(1)
    outputs: list[Output] = get_outputs_list()
    while True:
        niri_workspaces = get_niri_workspaces()
        outputs_ids_workspaces = get_niri_workspaces_with_output_ids(
            niri_workspaces,
            outputs,
        )
        print(
            json.dumps(outputs_ids_workspaces),
            flush=True,
        )
        if process.stdout.readline().decode("utf-8") == "":
            break


class NiriMsgActionWorkspaceOutput(TypedDict):
    name: str | None
    id: int
    output: Output
    is_focused: Literal[0, 1]


def get_niri_workspaces() -> dict[Output, list[NiriMsgActionWorkspaceOutput]]:
    workspaces_data = json.loads(
        subprocess.check_output(
            [
                "niri",
                "msg",
                "-j",
                "workspaces",
            ]
        )
    )
    output_workspaces_data = {}
    for output_id, wsp in enumerate(workspaces_data):
        output_workspaces_data.setdefault(
            output_id,
            [],
        ).append(
            {
                **wsp,
                "name": _get_workspace_name(wsp["name"]),
            }
        )
    return {
        k: sorted(v, key=lambda w: w["id"])  #
        for k, v in output_workspaces_data.items()
    }


def _get_workspace_name(niri_wsp_name: str) -> str:
    match niri_wsp_name:
        case "browser":
            return "󰖟"
        case "code":
            return ""
        case "orgmode":
            return ""
        case _:
            return "◦"


def get_outputs_list() -> list[Output]:
    return list(
        json.loads(
            subprocess.check_output(
                [
                    "niri",
                    "msg",
                    "-j",
                    "outputs",
                ]
            )
        ).keys()
    )


def get_niri_workspaces_with_output_ids(
    niri_workspaces: dict[Output, list[NiriMsgActionWorkspaceOutput]],
    outputs: list[Output],
) -> dict[int, list[NiriMsgActionWorkspaceOutput]]:
    return {
        outputs.index(k): v  #
        for k, v in niri_workspaces.items()
    }


if __name__ == "__main__":
    main()
