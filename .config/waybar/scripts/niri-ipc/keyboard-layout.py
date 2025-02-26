#!/usr/bin/python3

from collections import deque
from collections.abc import Generator
import json
from typing import IO


def main():
    niri_file = _init_niri_socket()
    deque(_print_layout_gen(niri_file))


def _init_niri_socket() -> IO:
    import os
    from socket import AF_UNIX, SHUT_WR, socket

    niri_socket = socket(AF_UNIX)
    niri_socket.connect(os.environ["NIRI_SOCKET"])

    niri_file = niri_socket.makefile("rw")
    niri_file.write('"EventStream"')
    niri_file.flush()

    niri_socket.shutdown(SHUT_WR)

    return niri_file


def _print_layout_gen(niri_file: IO) -> Generator[None]:
    names = []
    current = None
    for line in niri_file:
        event = json.loads(line)

        match event:
            case {
                "KeyboardLayoutsChanged": {
                    "keyboard_layouts": {"names": _, "current_idx": _} as layouts
                }
            }:
                names = layouts["names"]
                current = layouts["current_idx"]
            case {"KeyboardLayoutSwitched": {"idx": _} as switched}:
                current = switched["idx"]
            case _:
                continue

        print_layout(names, current)
        yield


def print_layout(names: list[str], current: int) -> None:
    if names[current].startswith("English"):
        text = ":)"
    elif names[current].startswith("Russian"):
        text = ":P"
    else:
        text = ":?"
    tooltip = names[current]
    print(json.dumps({"text": text, "tooltip": tooltip}), flush=True)


if __name__ == "__main__":
    main()
