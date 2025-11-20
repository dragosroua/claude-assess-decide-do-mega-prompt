Integrating this "Mega Prompt" into gemini-cli is straightforward because the tool is built to ingest context files (.md) natively.

Here are the three ways to do it, ranging from "Project Specific" to "Global Default."

## Method 1: The "Project Context" (Recommended)

Use this if you want the ADD Framework to be active only for specific projects where you need deep workflow help.
 * Create the file:
   In the root of your project folder, create a file named GEMINI.md.
 * Paste the prompt:
   Copy the Full-Fat Gemini Implementation code block (from my previous response) and paste it into GEMINI.md.
 * Run Gemini:
   Simply type gemini in your terminal while inside that folder.
   * Why this works: gemini-cli automatically looks for a GEMINI.md file in the current directory and treats it as the "System Context" or "Memory" for that session. The CLI will now respect the "Assess-Decide-Do" rules for that project.

## Method 2: The "On-Demand" Alias (Power User)

Use this if you want to summon the ADD Framework specifically when you are stuck, regardless of which folder you are in.
 * Save the prompt centrally:
   Save the prompt to a file in your home directory, e.g., ~/.gemini/prompts/ADD_FRAMEWORK.md.
 * Create an alias:
   Add a simple function or alias to your shell configuration (.bashrc, .zshrc, or config.fish).
   
   _In your .zshrc or .bashrc_
alias gemini-add='gemini --context ~/.gemini/prompts/ADD_FRAMEWORK.md'

   (Note: Depending on your gemini-cli version, you might need to use -p with a file pipe or check if it supports a specific context flag. If the flag isn't supported directly, use the piping method below):
   
   _Robust Alternative for any version_
   
alias gemini-add='cat ~/.gemini/prompts/ADD_FRAMEWORK.md | gemini'

 * Usage:
   When you are stuck in "Analysis Paralysis," just type gemini-add. The session will start with the framework loaded.

## Method 3: The "Global Override" (Permanent)

Use this if you want Gemini to always act this way, for every single interaction.
 * Locate your Global Config:
   Find your global gemini config folder, typically ~/.gemini/.
 * Create/Edit the Global GEMINI.md:
   If you place the prompt inside ~/.gemini/GEMINI.md, it applies to all sessions, even if you aren't in a specific project folder.
 * Verify it loaded:
   Start gemini anywhere.
   Type: "What is your operating framework?"
   If it answers "I operate on the Assess-Decide-Do framework," you are set.

## Summary Checklist
| Method | Use Case | Setup |
|---|---|---|
| Project (GEMINI.md) | You are building a specific app and want a strategist. | Create GEMINI.md in project root. |
| Alias (gemini-add) | You use Gemini casually, but sometimes need a "Workflow Fixer." | Add alias to shell config. |
| Global (~/.gemini/) | You want this to be your default AI assistant persona. | Add to ~/.gemini/GEMINI.md. |
Pro Tip: Since gemini-cli is text-based, the Table Output in the "Decide" phase of my prompt might render as Markdown. gemini-cli handles Markdown rendering beautifully, so the tables will look clean in your terminal.
