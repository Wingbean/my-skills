# my-skills

Personal AI agent skills สำหรับ Claude Code
รวบรวม skill ที่ใช้บ่อยและสร้างเองไว้ใช้ข้ามโปรเจคและข้ามเครื่อง

---

## ติดตั้ง

```bash
git clone https://github.com/Wingbean/my-skills.git ~/my-skills
bash ~/my-skills/install.sh
```

script จะ symlink แต่ละ skill เข้า `~/.claude/skills/` โดยอัตโนมัติ
ถ้า skill ไหนมีอยู่แล้วจะ skip — ไม่ทับของเดิม

---

## อัปเดต

```bash
cd ~/my-skills && git pull
bash ~/my-skills/install.sh  # ติดตั้ง skill ใหม่ที่ยังไม่มี
```

---

## Skills ที่มี

| Skill | วิธีเรียกใช้ | ทำอะไร |
|-------|-------------|--------|
| [project-knowledge](./project-knowledge/SKILL.md) | `/project-knowledge` | อ่านทั้งโปรเจคแล้วสรุปสิ่งที่ได้เรียนรู้ — errors, fixes, techniques, production problems — บันทึกเป็น `knowledge/<project>_knowledge.md` |

---

## เพิ่ม Skill ใหม่

```bash
mkdir ~/my-skills/ชื่อ-skill
# สร้าง SKILL.md ใน folder นั้น (ดู format ด้านล่าง)
cd ~/my-skills && git add . && git commit -m "add: ชื่อ-skill" && git push
# เครื่องอื่น: git pull + bash install.sh
```

### โครงสร้าง SKILL.md

```markdown
---
name: ชื่อ-skill
description: Use when [เงื่อนไขที่ควรใช้ skill นี้]
---

# ชื่อ Skill

เนื้อหาที่บอก AI ว่าต้องทำอะไร ขั้นตอนไหน output คืออะไร
```

---

## โครงสร้าง Repo

```
my-skills/
├── install.sh              script ติดตั้ง (symlink เข้า ~/.claude/skills/)
├── README.md
└── project-knowledge/
    └── SKILL.md
```
