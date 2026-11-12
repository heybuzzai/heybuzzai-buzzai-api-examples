# เปิด PowerShell ใหม่ ค่าเหล่านี้ใช้แทนบัญชี Anthropic เฉพาะในหน้าต่างนี้
$env:ANTHROPIC_BASE_URL = "https://api.heybuzzai.com"
$env:ANTHROPIC_AUTH_TOKEN = $env:BUZZAI_API_KEY
$env:ANTHROPIC_MODEL = "Qwen3.8-27B"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = "Qwen3.8-27B"
# ขนาด context ของแพ็ก: 128K = 131072 · 256K = 262144 · Mini (64K) = 64000
# Mini: agent จะสรุปย่อประวัติบ่อยกว่าแพ็ก 128K ถ้าใช้ Claude Code เป็นหลัก แนะนำ Lite ขึ้นไป
$env:CLAUDE_CODE_MAX_CONTEXT_TOKENS = "131072"
# ปิดสรุปตอนกลับมาที่ terminal และคำแนะนำ prompt สีเทา: ลดคำขอเบื้องหลังที่ไม่จำเป็น
$env:CLAUDE_CODE_ENABLE_AWAY_SUMMARY = "0"
$env:CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION = "false"

# แล้วเปิดใช้งานตามปกติ
claude
