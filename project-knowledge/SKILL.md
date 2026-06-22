---
name: project-knowledge
description: Use when wanting to harvest lessons learned from a project — read all project files and git history, then write a single knowledge/SKILL.md capturing what was learned: errors, root causes, fixes, surprising behaviors, production problems, and techniques discovered during the build.
---

# Project Knowledge Harvester

อ่านทั้งโปรเจค แล้วเขียน `knowledge/<ชื่อโปรเจค>_knowledge.md` ที่บันทึก **สิ่งที่ได้เรียนรู้จริงๆ** จากการสร้างโปรเจคนี้
ไม่ใช่เอกสาร architecture — แต่คือ retrospective ของนักพัฒนา

**ชื่อโปรเจค** — อ่านจาก `CLAUDE.md` หรือ `README.md` บรรทัดแรก หรือชื่อ root folder ของโปรเจค แล้วใช้เป็น lowercase-hyphen เช่น `uroman_knowledge.md`, `my-app_knowledge.md`

---

## สิ่งที่ต้องอ่าน

1. **git log --oneline -100** — ดู commit history ทั้งหมด โดยเฉพาะ commit ที่มี `fix:`, `bug`, `ci:`, `hotfix`
2. **docs/** ทุกไฟล์ — โดยเฉพาะ deploy notes, troubleshooting, ADR
3. **CLAUDE.md** — constraints และ decisions ที่บันทึกไว้
4. **source files หลัก** — หา pattern ที่น่าสนใจหรือ workaround ที่ไม่ obvious
5. **test files** — หา edge case ที่ถูก test เพราะเคย bug มาก่อน

---

## สิ่งที่ต้องเก็บ (เน้นสิ่งที่ไม่ obvious)

| หมวด | คำถามที่ต้องตอบ |
|------|----------------|
| **ข้อผิดพลาด & วิธีแก้** | เกิด error อะไร? สาเหตุจริงคืออะไร? แก้ยังไง? |
| **ปัญหา production / VPS** | อะไรพังตอน deploy? พัง deploy ครั้งแรกเพราะอะไร? |
| **พฤติกรรมระบบที่น่าสนใจ** | อะไรทำงานต่างจากที่คาด? อะไรที่ต้อง workaround? |
| **เทคนิคที่ใช้ได้ผล** | pattern ไหนที่แก้ปัญหาได้สวย? อะไรที่นำไปใช้โปรเจคอื่นได้? |
| **สิ่งที่ไม่รู้มาก่อน** | อะไรที่ค้นพบระหว่างทำที่ไม่ได้ plan ไว้? |
| **Limitation ที่รู้อยู่** | อะไรที่ยังไม่ได้แก้? ทำไมถึงยอมรับได้? |

**ห้ามเก็บ:** สิ่งที่หาได้จาก README หรือ CLAUDE.md โดยตรง เช่น architecture diagram หรือ route list ธรรมดา

---

## Output

บันทึกที่ `knowledge/<ชื่อโปรเจค>_knowledge.md` (สร้าง folder ถ้ายังไม่มี)
เช่น โปรเจคชื่อ uroman → `knowledge/uroman_knowledge.md`

---

## Template

```markdown
---
project: PROJECT_NAME
tags: [tag1, tag2]
stack: stack สั้นๆ
date: YYYY-MM-DD
---

# สิ่งที่ได้เรียนรู้จาก PROJECT_NAME

## ข้อผิดพลาดและวิธีแก้ไข

> [!error] ชื่อ error / symptom ที่เห็น
> **เกิดจาก:** อธิบายสาเหตุจริง (ไม่ใช่แค่ symptom)
>
> **วิธีแก้:**
> ​```
> code หรือคำสั่งที่ใช้จริง
> ​```
>
> **เรียนรู้ว่า:** ประโยคสั้นๆ ว่านำบทเรียนนี้ไปใช้ที่ไหนได้อีก

---

## ปัญหาตอนนำขึ้น Production / VPS

> [!bug] ชื่อปัญหา
> อธิบายว่าเกิดอะไร ตอนไหน และทำให้เสียเวลานานแค่ไหน
>
> **Root cause:**
> **Fix:**
> **ป้องกันครั้งหน้า:**

---

## เทคนิคที่ดีที่ได้เรียนรู้

> [!tip] ชื่อเทคนิค
> อธิบายว่าทำอะไร ทำไมถึง work และจะนำไปใช้ที่ไหนได้อีก

---

## พฤติกรรมระบบที่น่าสนใจ / ไม่คาดคิด

> [!info] หัวข้อ
> อธิบายว่าอะไรทำงานต่างจากที่คาด และทำไม

---

## สิ่งที่รู้แล้วจะทำต่างออกไป

- ถ้าทำใหม่จะ... เพราะ...
- อย่าทำ... เพราะ...

---

## Known Limitations (ยอมรับได้เพราะ...)

- [ ] limitation — เหตุผลที่ยังไม่แก้
```

---

## กฎการเขียน

- เขียนในมุมมอง **"เราได้เรียนรู้ว่า..."** ไม่ใช่ "ระบบทำงานโดย..."
- ทุก error section ต้องมี **root cause จริง** ไม่ใช่แค่ symptom
- ทุก tip ต้องบอกว่า **นำไปใช้ที่ไหนได้อีก**
- เขียนเป็นภาษาไทยยกเว้น technical terms และ code
- ถ้า section ไหนไม่มีข้อมูลจริงจาก project — ข้าม อย่าแต่งขึ้นมา
