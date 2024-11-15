require('dotenv').config();
const { HfInference } = require('@huggingface/inference');
const hf = new HfInference(process.env.HUGGINGFACE_API_KEY);
const { Client } = require("oceanic.js");

const client = new Client({
    auth: `Bot ${process.env.DISCORD_BOT_TOKEN}`,
    gateway: {
        intents: ["GUILDS", "GUILD_MEMBERS", "GUILD_MESSAGES", "MESSAGE_CONTENT"],
    },
});

client.on("ready", () => {
    console.log(`${client.user.username} is ready!`);
});

async function getResponse(prompt) {
    const response = await hf.textGeneration({
        model: 'mistralai/Mistral-Nemo-Instruct-2407',
        inputs: prompt,
    });
    return response.generated_text.split('\n').pop();
}

client.on("messageCreate", async (message) => {
    if (message.author.bot) return;
    try {
        await client.rest.channels.createMessage(message.channelID, {
            content: "<a:loading:1270778203471876096> Bébours réfléchit...",
        }).then(async m => {
            const response = await getResponse(`Tu es Bébours un ours polaire et tu vis en colocation avec Paul, Jérémy, Thomas et Théo. Tu as une ex-copine qui s'appelle Serge. Maintenant, quelqu'un te pose cette question : "${message.content}" Réponds seulement à la question en français.\n`);
            await m.edit({
                content: response,
            })
        });

    } catch (error) {
        console.error(error);
    }
});

client.connect();