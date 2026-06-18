#!/usr/bin/env bash
# gstack — Garry Tan's Claude Code workflow stack (OpenCode edition)
# Installs to ~/.local/share/gstack/ and links skills to ~/.config/opencode/skills/
set -euo pipefail

GSTACK_DIR="$HOME/.local/share/gstack"
SKILLS_DIR="$HOME/.config/opencode/skills"
GSTACK_REPO="https://github.com/garrytan/gstack.git"

install_gstack() {
    # Already installed and setup done? Quick check
    if [ -d "$GSTACK_DIR/.opencode/skills" ] && [ -d "$SKILLS_DIR/gstack" ]; then
        echo ">>> gstack already installed, skipping."
        return 0
    fi

    echo ">>> Installing gstack for OpenCode..."

    # Clone if not exists
    if [ ! -d "$GSTACK_DIR/.git" ]; then
        mkdir -p "$(dirname "$GSTACK_DIR")"
        git clone --single-branch --depth 1 "$GSTACK_REPO" "$GSTACK_DIR"
    fi

    # Build opencode skills + runtime
    cd "$GSTACK_DIR"
    bun install --frozen-lockfile 2>/dev/null || bun install
    bun run build
    bun run gen:skill-docs --host opencode 2>/dev/null || true

    # Create runtime root in skills dir
    mkdir -p "$SKILLS_DIR"
    mkdir -p "$SKILLS_DIR/gstack/browse" "$SKILLS_DIR/gstack/design" \
             "$SKILLS_DIR/gstack/gstack-upgrade" "$SKILLS_DIR/gstack/review" \
             "$SKILLS_DIR/gstack/qa" "$SKILLS_DIR/gstack/plan-devex-review"

    # Link runtime assets
    ln -snf "$GSTACK_DIR/bin"                        "$SKILLS_DIR/gstack/bin"
    ln -snf "$GSTACK_DIR/browse/dist"                "$SKILLS_DIR/gstack/browse/dist"
    ln -snf "$GSTACK_DIR/browse/bin"                 "$SKILLS_DIR/gstack/browse/bin"
    ln -snf "$GSTACK_DIR/design/dist"                "$SKILLS_DIR/gstack/design/dist"
    ln -snf "$GSTACK_DIR/ETHOS.md"                   "$SKILLS_DIR/gstack/ETHOS.md"
    [ -f "$GSTACK_DIR/plan-devex-review/dx-hall-of-fame.md" ] && \
        ln -snf "$GSTACK_DIR/plan-devex-review/dx-hall-of-fame.md" \
               "$SKILLS_DIR/gstack/plan-devex-review/dx-hall-of-fame.md"

    # Root skill + upgrade
    [ -f "$GSTACK_DIR/.opencode/skills/gstack/SKILL.md" ] && \
        ln -snf "$GSTACK_DIR/.opencode/skills/gstack/SKILL.md" \
               "$SKILLS_DIR/gstack/SKILL.md"
    [ -f "$GSTACK_DIR/.opencode/skills/gstack-upgrade/SKILL.md" ] && \
        ln -snf "$GSTACK_DIR/.opencode/skills/gstack-upgrade/SKILL.md" \
               "$SKILLS_DIR/gstack/gstack-upgrade/SKILL.md"

    # Runtime review assets
    for f in checklist.md design-checklist.md greptile-triage.md TODOS-format.md; do
        [ -f "$GSTACK_DIR/review/$f" ] && ln -snf "$GSTACK_DIR/review/$f" "$SKILLS_DIR/gstack/review/$f"
    done
    [ -d "$GSTACK_DIR/review/specialists" ] && \
        ln -snf "$GSTACK_DIR/review/specialists" "$SKILLS_DIR/gstack/review/specialists"
    [ -d "$GSTACK_DIR/qa/templates" ] && \
        ln -snf "$GSTACK_DIR/qa/templates" "$SKILLS_DIR/gstack/qa/templates"
    [ -d "$GSTACK_DIR/qa/references" ] && \
        ln -snf "$GSTACK_DIR/qa/references" "$SKILLS_DIR/gstack/qa/references"

    # Link all gstack-* skills
    for skill_dir in "$GSTACK_DIR"/.opencode/skills/gstack-*/; do
        [ -f "$skill_dir/SKILL.md" ] || continue
        skill_name="$(basename "$skill_dir")"
        target="$SKILLS_DIR/$skill_name"
        [ -L "$target" ] || [ ! -e "$target" ] && ln -snf "$skill_dir" "$target"
    done

    echo ">>> gstack ready ($(ls -d "$SKILLS_DIR"/gstack* 2>/dev/null | wc -l) skills)."
}

install_gstack
