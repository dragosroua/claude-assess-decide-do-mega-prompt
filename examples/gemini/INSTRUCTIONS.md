## Option A: Using Google AI Studio (Recommended for Builders)

1. Go to Google AI Studio.

2. Create a New Prompt (Chat Prompt).

3. Locate the System Instructions box on the top left.

4. Paste the entire code block above into that box.

5. (Optional) Add a variable {{user_context}} if you want to inject specific project details later.

6. Save this as "ADD Framework Agent".

## Option B: Using Gemini Advanced / Consumer App

1. Open a new chat.

2. Paste the prompt above as your first message.

3. Critical Step: Gemini might say "Understood." You must then "pin" this logic by saying:

• "acknowledge you have loaded the ADD framework by analyzing this sentence: 'I want to build a website but I don't know what stack to use'."

4. If it replies with [ADD STATE: ASSESS] and asks clarifying questions, the state machine is active.
