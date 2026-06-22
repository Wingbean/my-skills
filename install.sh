#!/usr/bin/env bash
# ติดตั้ง personal skills โดย symlink เข้า ~/.claude/skills/
# ใช้: bash install.sh

SKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

for skill in "$SKILLS_DIR"/*/; do
    name="$(basename "$skill")"
    target="$TARGET_DIR/$name"

    if [ -L "$target" ]; then
        echo "skip (symlink อยู่แล้ว): $name"
    elif [ -d "$target" ]; then
        echo "skip (folder มีอยู่แล้ว ไม่ใช่ symlink): $name"
    else
        ln -s "$skill" "$target"
        echo "installed: $name → $target"
    fi
done

echo "done"
