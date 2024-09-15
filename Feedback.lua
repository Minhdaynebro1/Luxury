local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("World Sjw Hub | FeedBack👤", DarkTheme)
local Home = Window:NewTab("Test")
local Section = Home:NewSection("Feedback")
local Webhook_URL = "https://discord.com/api/webhooks/1284789503059300465/V0-Y8KPaxZqXLxmPQPN4dlzULexvlNNFnghAZg32EDAsEauF1QuGlOp6K0QTRxNZZlAc"
Section:NewTextBox("Feedback", "Type Here", function(text)
   feedbackMessage = text
end)

Section:NewButton("Send Feedback", "Send", function()
   if feedbackMessage then
local Headers = {
    ['Content-Type'] = 'application/json',
}

local data = {
    ["embeds"] = {
        {
            ["title"] = "<a:3160botdiscord:1259040301914259556> Someone Sent Feedback : [ WORLD SJW HUB ]",
            ["description"] = "**Someone Already Gave Feedback**  <@928369950761041990> ",
            ["color"] = tonumber(0x7269da),
            ["fields"] = {
                {
                    ["name"] = "**__FeedBack:__**",
                    ["value"] = feedbackMessage,
                    ["inline"] = true,
                },
                {
                    ["name"] = "**__Send By:__**",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = true,
                },
                {
                    ["name"] = "**__Game Name:__**",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true,
                },
                {
                    ["name"] = "**__Execution Time:__**",
                    ["value"] = os.date("%Y-%m-%d %H:%M:%S", os.time()),
                    ["inline"] = true,
                },
            },
        },
    },
}

local PlayerData = game:GetService('HttpService'):JSONEncode(data)

local Request = http_request or request or HttpPost or syn.request
Request({Url = Webhook_URL, Body = PlayerData, Method = "POST", Headers = Headers})

        local success, errorMessage = pcall(function()
            HttpService:PostAsync(Webhook_URL, payloadJson, Enum.HttpContentType.ApplicationJson, false, headers)
        end)

        if success then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Success",
                Text = "Feedback sent successfully to Discord!",
                Duration = 5
            })
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "Failed to send feedback to Discord: " .. errorMessage,
                Duration = 5
            })
        end
    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Error",
            Text = "Please enter feedback before sending.",
            Duration = 5
        })
    end
end)
