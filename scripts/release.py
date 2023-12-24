#!/usr/bin/env python3

"""
Usage example:
python scripts/release.py v1.0.0
"""

import os
import subprocess
import sys


def run(command):
    subprocess.run(command, check=True)


def check_working_directory():
    # Check for untracked files
    untracked_files = subprocess.check_output(
        ["git", "ls-files", ".", "--exclude-standard", "--others"], text=True
    ).strip()
    if untracked_files:
        print("Error: Please stash or remove the untracked files!")
        sys.exit(1)


def check_tag():
    # Check if a tag is provided
    if len(sys.argv) < 2:
        print("Error: Please provide a tag!")
        sys.exit(1)


def update_changelog(version):
    print("Updating the changelog")
    try:
        run(
            [
                "git-cliff",
                "--config",
                "configs/cliff.toml",
                "--tag",
                version,
                "--output",
                "CHANGELOG.md",
            ],
        )
    except subprocess.CalledProcessError as e:
        print(f"Failed to update the changelog")
        print(f"stderr: {e.stderr}")
        sys.exit(1)

    # Run formatting with just
    try:
        run(["just", "fmt"])
    except subprocess.CalledProcessError as e:
        print(f"Error running just fmt: {e}")
        sys.exit(1)


def update_version_file(version):
    # Write the new_version to a file 'version'
    with open("version", "w") as version_file:
        version_file.write(version)


def commit(version):
    run(["git", "add", "--all"])
    run(["git", "commit", "--message=" + version])
    run(["git", "show"])
    run(
        [
            "git",
            "tag",
            "--sign",
            "--annotate",
            version,
            "--message=" + version,
            "--message=For details, see the CHANGELOG.md",
        ],
    )
    run(["git", "tag", "--verify", version])


def main():
    version = sys.argv[1]
    version_number = version.replace("v", "")

    check_working_directory()
    check_tag()
    update_changelog(version)
    update_version_file(version_number)
    commit(version)


if __name__ == "__main__":
    main()
