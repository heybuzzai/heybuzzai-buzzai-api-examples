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
