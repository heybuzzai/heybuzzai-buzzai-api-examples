# buzzAI API examples

ตัวอย่างตั้งค่าและโค้ดสำหรับ [buzzAI](https://heybuzzai.com/) API: Claude Code, Codex CLI, Python, Node.js และ curl

Setup and code examples for the [buzzAI](https://heybuzzai.com/) API: Claude Code, Codex CLI, Python, Node.js and curl.

> Repo นี้ดูแลโดยทีม buzzAI · This repo is maintained by the buzzAI team.

## buzzAI คืออะไร · What buzzAI is

- buzzAI คือ API สำหรับ coding agent แบบเหมาจ่ายเป็นเงินบาท ไม่คิดค่า token และไม่มีโควตารายวันหรือรายสัปดาห์
- ใช้โมเดลเดียวคือ `Qwen3.8-27B` โมเดล open-weight สัญญาอนุญาต Apache 2.0 การ์ด GPU ของเรารันรุ่น NVFP4 (4-bit) ที่ NVIDIA ทำจากโมเดลนี้ (`nvidia/Qwen3.8-27B-NVFP4`) ไม่ใช่ weight ความละเอียดเต็ม
- รองรับ OpenAI Chat Completions, OpenAI Responses และ Anthropic Messages ใช้กับ Claude Code, Codex CLI และเครื่องมือที่ตั้ง base URL กับ API key เองได้

<!-- -->

- buzzAI is a flat-rate API for coding agents, priced in Thai baht. It doesn't charge per token and has no daily or weekly quota.
- It serves one model, `Qwen3.8-27B`, an open-weight model under Apache 2.0. Our GPUs run NVIDIA's NVFP4 (4-bit) build of it (`nvidia/Qwen3.8-27B-NVFP4`), not the full-precision weights.
- It speaks OpenAI Chat Completions, OpenAI Responses and Anthropic Messages, so it works with Claude Code, Codex CLI and tools that let you set a base URL and API key.

## สถานะ · Status

ตอนนี้เปิดให้ขอร่วมทดสอบรอบที่ 1 จำนวนจำกัด รอบนี้จะเปิดใช้เมื่อมีผู้สมัครครบโควต้าที่กำหนด แล้วเราจะส่ง API key ทางอีเมล การส่งแบบฟอร์มยังไม่ใช่การชำระเงิน หลังขอร่วมทดสอบ ทีมจะติดต่อเรื่องชำระเงินผ่านพร้อมเพย์หรือโอนเงินเข้าบัญชีธนาคารทางอีเมล

Round 1 is open for sign-ups, in limited numbers. The API opens for this round once sign-ups reach the round's quota, and then we email you an API key. Signing up is not a payment. After you join, the team emails you to arrange payment by PromptPay or bank transfer.

**[ขอร่วมทดสอบ · Join round 1](https://heybuzzai.com/#waitlist)**

## แพ็กและราคา · Plans and prices

ราคาเป็นเงินบาท ทุกแพ็กไม่คิดค่า token · Prices are in Thai baht. No plan charges per token.

| Plan | Price | Agents at once | Accounts | Context | Queue lane |
|---|---|---|---|---|---|
| Day Pass | ฿99 / day | 1 | 1 person | 128K | Normal |
| Week Pass | ฿390 / 7 days | 1 | 1 person | 128K | Normal |
| Mini | ฿490 / month | 1 | 1 person | 64K | Normal |
| Lite | ฿990 / month | 1 | 1 person | 128K | Normal |
| Solo | ฿1,690 / month | 1 | 1 person | 256K | Priority |
| Studio | ฿7,900 / month | 1 | 3 | 256K | Priority+ |
| Starter | ฿15,900 / month | 2 | 6 | 256K | Priority+ |
| Team | ฿31,900 / month | 4 | 12 | 256K | Priority+ |
| Business | ฿62,900 / month | 8 | 24 | 256K | Priority+, SLA 99.5% availability in business hours |
| Dedicated | Contact sales | A whole GPU card | — | Set to your work | Your own card |

- แพ็ก Personal (Day Pass, Week Pass, Mini, Lite และ Solo) ใช้ได้ 1 คน รันได้ทีละ 1 agent ถ้าเครื่องมือของคุณแตก sub-agent ก็ยังใช้ได้ แต่ sub-agent จะผลัดกันทำงานทีละตัว พนักงานของบริษัทให้ใช้แพ็กบริษัท
- แพ็กบริษัทคิดตามจำนวน agent ที่รันพร้อมกัน และจำนวน account ที่ใช้ร่วมกันทั้งทีม ทุกแพ็กบริษัทซื้อช่องจอง Reserved เพิ่มได้ ช่องละ 12,900 บาทต่อเดือน
- ช่วงที่คนใช้เยอะอาจต้องรอคิว ใครเพิ่งใช้ไปน้อยจะได้คิวก่อน ในเวลาทำการ (จันทร์–ศุกร์ 08:00–20:00 น.) แพ็กบริษัทและช่องจองได้ใช้ก่อน แพ็ก Personal จึงอาจต้องรอคิว
- ราคาแพ็กบริษัทยังไม่รวม VAT ตอนนี้ยังไม่เก็บ เพราะเรายังไม่ได้จด VAT

<!-- -->

- Personal plans (Day Pass, Week Pass, Mini, Lite and Solo) are for one person and run one agent at a time. If your tool starts sub-agents, they still work, but they take turns. Company staff should use a company plan.
- Company plans are sold by agents at once and by accounts shared across the team. Any company plan can add a Reserved slot at ฿12,900 per slot per month.
- At peak times you may have to queue. People who have used less recently go first. In business hours (Monday to Friday, 08:00–20:00 Thailand time), company plans and reserved slots go first, so Personal plans may wait.
- Company plan prices exclude VAT. We don't charge VAT yet, because buzzAI is not VAT-registered.

ดูรายละเอียดทุกแพ็ก · Full details: <https://heybuzzai.com/pricing/>

## ก่อนเริ่ม · Before you start

| | |
|---|---|
| Base URL (OpenAI-compatible) | `https://api.heybuzzai.com/v1` |
| Base URL (Claude Code, Anthropic Messages) | `https://api.heybuzzai.com` (ไม่มี `/v1` · no `/v1`) |
| Model | `Qwen3.8-27B` |
| API key | environment variable `BUZZAI_API_KEY` |

เก็บ key ไว้ใน environment variable บนเครื่องของคุณ หรือใน secret ของ CI · Keep the key in an environment variable on your machine, or in your CI's secrets.

```bash
# macOS / Linux
export BUZZAI_API_KEY="<API key ของคุณ>"
```

```powershell
# PowerShell
$env:BUZZAI_API_KEY = "<API key ของคุณ>"
```

ห้าม commit key ลง Git และห้ามใส่ key ในโค้ดที่ส่งไปเบราว์เซอร์หรือแอปมือถือ แอปที่มีผู้ใช้ให้เรียก API จากฝั่งเซิร์ฟเวอร์เท่านั้น

Never commit the key to Git, and never put it in code that ships to a browser or a mobile app. If your app has users, call the API from your server.

## Claude Code

**ทดสอบกับระบบจริงแล้ว · Tested end to end**

Claude Code คุยแบบ Anthropic Messages จึงใส่ base URL ที่ไม่มี `/v1` เพราะ Claude Code ต่อ `/v1/messages` ให้เอง ค่าเหล่านี้ใช้แทนบัญชี Anthropic เฉพาะใน shell ที่เปิด ตั้ง `CLAUDE_CODE_MAX_CONTEXT_TOKENS` ให้ตรงกับ context ของแพ็ก

Claude Code speaks Anthropic Messages, so its base URL has no `/v1`: Claude Code adds `/v1/messages` itself. These variables replace your Anthropic account only in the shell where you set them. Set `CLAUDE_CODE_MAX_CONTEXT_TOKENS` to your plan's context.

macOS / Linux ([examples/claude-code.sh](examples/claude-code.sh)):

```bash
# เปิด shell ใหม่ ค่าเหล่านี้ใช้แทนบัญชี Anthropic เฉพาะใน shell นี้
export ANTHROPIC_BASE_URL="https://api.heybuzzai.com"
export ANTHROPIC_AUTH_TOKEN="$BUZZAI_API_KEY"
export ANTHROPIC_MODEL="Qwen3.8-27B"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="Qwen3.8-27B"
# ขนาด context ของแพ็ก: 128K = 131072 · 256K = 262144 · Mini (64K) = 64000
# Mini: agent จะสรุปย่อประวัติบ่อยกว่าแพ็ก 128K ถ้าใช้ Claude Code เป็นหลัก แนะนำ Lite ขึ้นไป
export CLAUDE_CODE_MAX_CONTEXT_TOKENS=131072
# ปิดสรุปตอนกลับมาที่ terminal และคำแนะนำ prompt สีเทา: ลดคำขอเบื้องหลังที่ไม่จำเป็น
export CLAUDE_CODE_ENABLE_AWAY_SUMMARY=0
export CLAUDE_CODE_ENABLE_PROMPT_SUGGESTION=false

# แล้วเปิดใช้งานตามปกติ
claude
```

PowerShell ([examples/claude-code.ps1](examples/claude-code.ps1)):

```powershell
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
```

What the comments say:

- Open a new shell (or PowerShell window). These values replace your Anthropic account only there.
- Context per plan: 128K = `131072`, 256K = `262144`, Mini (64K) = `64000`. On Mini the agent compacts its history more often than on a 128K plan. If Claude Code is your main tool, use Lite or above.
- The last two variables turn off the away summary and the greyed-out prompt suggestion. Each of those costs a background request you don't need.
- Then start `claude` as usual.

Anthropic ไม่ซัพพอร์ตการใช้ Claude Code กับโมเดลที่ไม่ใช่ Claude ฟีเจอร์บางอย่างจึงอาจทำงานต่างไป · Anthropic doesn't support Claude Code with non-Claude models, so some features may behave differently.

## Codex CLI

**ทดสอบกับระบบจริงแล้ว · Tested end to end**

Codex อ่านค่าจาก `~/.codex/config.toml` ตั้ง `wire_api = "responses"` ตามตัวอย่าง Codex อ่าน key จาก `env_key` คือ `BUZZAI_API_KEY` ไม่ต้องใส่ key ในไฟล์ สำรอง config เดิมก่อนแก้

Codex reads `~/.codex/config.toml`. Keep `wire_api = "responses"` as shown. Codex reads the key from the variable named in `env_key` (`BUZZAI_API_KEY`), so the key never goes in the file. Back up your existing config before you edit it.

macOS / Linux:

```
# ~/.codex/config.toml
model = "Qwen3.8-27B"
model_provider = "buzzai"

[model_providers.buzzai]
name = "buzzAI"
base_url = "https://api.heybuzzai.com/v1"
env_key = "BUZZAI_API_KEY"
wire_api = "responses"

# แล้วใส่ API key และเปิดใช้งานตามปกติ
export BUZZAI_API_KEY="<API key ของคุณ>"
codex
```

PowerShell:

```
# %USERPROFILE%\.codex\config.toml
model = "Qwen3.8-27B"
model_provider = "buzzai"

[model_providers.buzzai]
name = "buzzAI"
base_url = "https://api.heybuzzai.com/v1"
env_key = "BUZZAI_API_KEY"
wire_api = "responses"

# แล้วใส่ API key และเปิดใช้งานตามปกติ
$env:BUZZAI_API_KEY = "<API key ของคุณ>"
codex
```

The lines down to `wire_api` go in the config file ([examples/codex-config.toml](examples/codex-config.toml)). The last two lines run in your terminal: set the key, then start `codex` as usual.

## Python, Node.js และ curl · Python, Node.js and curl

ใช้ OpenAI SDK เดิม เปลี่ยนแค่ base URL และอ่าน key จาก environment variable ตัวอย่างเหล่านี้เรียก Chat Completions ที่ `https://api.heybuzzai.com/v1` เราทดสอบครบทุกขั้นกับระบบจริงเฉพาะ Claude Code และ Codex CLI ตัวอย่าง SDK และ curl ใช้รูปแบบ OpenAI-compatible เดียวกัน แต่เรายังไม่ได้ทดสอบทุก SDK และทุกเวอร์ชัน

Use the official OpenAI SDK and change only the base URL; read the key from the environment. These examples call Chat Completions at `https://api.heybuzzai.com/v1`. We have tested Claude Code and Codex CLI end to end. The SDK and curl examples use the same OpenAI-compatible format, but we haven't tested every SDK or every version.

### Python ([examples/python.py](examples/python.py))

```python
# pip install openai
import os
from openai import OpenAI

client = OpenAI(
    base_url="https://api.heybuzzai.com/v1",
    api_key=os.environ["BUZZAI_API_KEY"],
)

reply = client.chat.completions.create(
    model="Qwen3.8-27B",
    messages=[{"role": "user", "content": "Write tests for utils/date.py"}],
)
print(reply.choices[0].message.content)
```

Run: `pip install openai`, then `python examples/python.py`.

### Node.js ([examples/node.mjs](examples/node.mjs))

```js
// npm install openai
import OpenAI from "openai";

const client = new OpenAI({
  baseURL: "https://api.heybuzzai.com/v1",
  apiKey: process.env.BUZZAI_API_KEY,
});

const reply = await client.chat.completions.create({
  model: "Qwen3.8-27B",
  messages: [{ role: "user", content: "Write tests for utils/date.ts" }],
});
console.log(reply.choices[0].message.content);
```

Run: `npm install openai`, then `node examples/node.mjs`. เรียกจากฝั่งเซิร์ฟเวอร์เท่านั้น · Call it from a server only.

### curl ([examples/curl.sh](examples/curl.sh), [examples/curl.ps1](examples/curl.ps1))

ใช้ตรวจ key และ URL ก่อนตั้งค่าเครื่องมือ ถ้า curl ผ่าน ใช้ค่าชุดเดียวกันในเครื่องมือของคุณ · Use curl to check your key and URL before you set up a tool. If curl works, use the same values in your tool.

```bash
curl "https://api.heybuzzai.com/v1/chat/completions" \
  -H "Authorization: Bearer $BUZZAI_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "Qwen3.8-27B",
    "messages": [{"role": "user", "content": "Write tests for utils/date.py"}]
  }'
```

```powershell
$body = @{
  model    = "Qwen3.8-27B"
  messages = @(@{ role = "user"; content = "Write tests for utils/date.py" })
} | ConvertTo-Json -Depth 5

Invoke-RestMethod "https://api.heybuzzai.com/v1/chat/completions" -Method Post `
  -Headers @{ Authorization = "Bearer $env:BUZZAI_API_KEY" } `
  -ContentType "application/json" -Body $body
```

## เครื่องมืออื่น · Other tools

**ยังไม่ได้ทดสอบโดยทีมเรา · Not tested by us**

buzzAI ใช้กับเครื่องมือที่ให้ตั้ง base URL และ API key เองแบบ OpenAI-compatible เช่น Cline, OpenCode, Aider และ n8n เลือก provider แบบ OpenAI Compatible แล้วใส่ 3 ค่านี้ ตั้ง context window ไม่เกินขนาด context ของแพ็ก ถ้ายังใช้ Roo Code ที่ติดตั้งไว้ ก็ใส่ค่าชุดเดียวกัน แต่ Roo Code เลิกพัฒนาแล้ว ([อ่านเพิ่ม](https://heybuzzai.com/blog/cline-roo-code-guide/))

เรายังไม่ได้ทดสอบเครื่องมือเหล่านี้ทุกตัว คำว่า compatible ไม่ได้ยืนยันว่าทุกฟีเจอร์จะทำงานเหมือนกัน ลองกับงานจริงก่อน

buzzAI works with tools that let you set an OpenAI-compatible base URL and API key, such as Cline, OpenCode, Aider and n8n. Pick the "OpenAI Compatible" provider and enter these three values. Set the context window no larger than your plan's context. A Roo Code install you already have takes the same values, but Roo Code is no longer developed.

We haven't tested every one of these tools. "Compatible" doesn't mean every feature works the same way, so try it on real work first.

```text
Base URL: https://api.heybuzzai.com/v1
API key:  <API key ของคุณ>
Model:    Qwen3.8-27B
```

## แก้ปัญหา · Troubleshooting

ลองค่าชุดเดียวกันด้วย curl ก่อน ถ้า curl ผ่าน ปัญหามักอยู่ที่การตั้งค่าเครื่องมือ · Try the same values with curl first. If curl works, the problem is usually in the tool's settings.

| Error | ตรวจอะไร | What to check |
|---|---|---|
| `401` | บัญชีเปิดใช้แล้วหรือยัง (รอบที่ 1 เปิดใช้เมื่อมีผู้สมัครครบโควต้าที่กำหนด) ใช้ key ของ buzzAI ที่ยังมีผล ไม่มีช่องว่างติดมา และตั้ง `BUZZAI_API_KEY` ใน shell เดียวกับที่เปิดเครื่องมือ | Is your account active yet? (Round 1 opens once sign-ups reach the quota.) Use a current buzzAI key with no stray spaces, set in the same shell you start the tool from. |
| `404` | Claude Code ใช้ URL ไม่มี `/v1` แบบ Anthropic Messages ส่วน Codex ใช้ Responses และเครื่องมืออื่นใส่ถึง `/v1` | Claude Code uses the URL without `/v1` (Anthropic Messages). Codex uses Responses, and other tools use the URL with `/v1`. |
| Model name | ตั้งชื่อโมเดลเป็น `Qwen3.8-27B` ตรงตามตัวอย่าง | Set the model name to exactly `Qwen3.8-27B`. |
| Context / long tasks | ตั้ง context ไม่เกินแพ็ก ลดประวัติที่ไม่จำเป็น เริ่ม session ใหม่เมื่อเปลี่ยนงาน และตรวจ timeout ของเครื่องมือ | Keep the context within your plan, cut history you don't need, start a new session when you switch tasks, and check your tool's timeout. |

Context ตามแพ็ก · Context by plan:

| Plan | Context | `CLAUDE_CODE_MAX_CONTEXT_TOKENS` |
|---|---|---|
| Mini | 64K | `64000` |
| Day Pass, Week Pass, Lite | 128K | `131072` |
| Solo, Studio, Starter, Team, Business | 256K | `262144` |
| Dedicated | ตั้งเองได้ · set to your work | — |

ยังไม่ได้? ส่งอีเมลหา support@heybuzzai.com แนบชื่อเครื่องมือ เวอร์ชัน เวลา และรหัสข้อผิดพลาด ห้ามแนบ API key หรือโค้ดที่เป็นความลับ

Still stuck? Email support@heybuzzai.com with the tool name, its version, the time and the error code. Never send your API key or secret code.

## ข้อมูลของคุณ · Your data

- เราไม่เอาข้อมูลหรือโค้ดของคุณไปเทรนโมเดล
- ตอนนี้งานประมวลผลบนเซิร์ฟเวอร์ GPU ของผู้ให้บริการคลาวด์ในต่างประเทศ ถ้าต้องการให้เครื่องอยู่ในไทย แพ็ก Dedicated เลือกวางเครื่องในไทยได้ (เสนอราคาแยก)

<!-- -->

- We don't use your data or code to train models.
- Requests run on cloud GPU servers outside Thailand. If you need the hardware in Thailand, the Dedicated plan can place it there (quoted separately).

More: <https://heybuzzai.com/privacy/>

## ลิงก์ · Links

- เว็บไซต์ · Website: <https://heybuzzai.com/>
- คู่มือ API · API guide: <https://heybuzzai.com/api-guide/>
- แพ็กและราคา · Pricing: <https://heybuzzai.com/pricing/>
- คำนวณค่าใช้จ่าย · Cost calculator: <https://heybuzzai.com/api-cost/>
- ลองสั่ง agent · Playground: <https://heybuzzai.com/playground/>
- ขอร่วมทดสอบ · Join: <https://heybuzzai.com/#waitlist>
- LINE: [@809yvtlb](https://line.me/R/ti/p/@809yvtlb)
- อีเมล · Email: support@heybuzzai.com

---

Repo นี้ดูแลโดยทีม buzzAI · This repo is maintained by the buzzAI team.

โค้ดตัวอย่างใช้สัญญาอนุญาต MIT นำไปใช้และแก้ได้ ดูไฟล์ [LICENSE](LICENSE) · The example code is MIT-licensed; see [LICENSE](LICENSE).

ชื่อและโลโก้ของเครื่องมืออื่นเป็นเครื่องหมายการค้าของเจ้าของแต่ละราย ใช้เพื่อบอกว่าใช้งานร่วมกันได้เท่านั้น · Other tools' names are trademarks of their owners, used here only to show compatibility.
