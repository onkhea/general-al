// codeunit 50651 Telegrams
// {
//     Permissions =
//         tabledata "Telegram Setup" = R,
//         tabledata "Telegram Users" = RIM;
//     trigger OnRun();
//     begin
//     end;

//     var
//         TelegramSetup: Record "Telegram Setup";
//         UserSetup: Record "Telegram Users";

//     procedure GetUpdates(Id: Code[20]; UserId: Integer; Token: text[100]);
//     var
//         Client: HttpClient;
//         ResponseMessage: HttpResponseMessage;
//         JsonValue: JsonValue;
//         RequestLabel: label 'https://api.telegram.org/bot%1/getUpdates';
//         InputText, RequestText : text;
//     begin

//         if TelegramSetup.Get(Id) then
//             TelegramSetup.TestField(Token);
//         RequestText := StrSubstNo(RequestLabel, Token);

//         if not Client.Get(RequestText, ResponseMessage) then
//             Error(ResponseMessage.ReasonPhrase);

//         if not ResponseMessage.IsSuccessStatusCode then
//             Error(Format(ResponseMessage.IsSuccessStatusCode));

//         ResponseMessage.Content.ReadAs(InputText);

//         CreateTelegramUser(InputText, Token);


//     end;

//     local procedure CreateTelegramUser(var InputText: text; token: Text[100])
//     var
//         JsonObject: JsonObject;
//         TelegramChatID: Integer;
//         JsonT, JsonToken, JsonFrom, JsonMessage : JsonToken;
//         TelegramCommand: Text;
//         test: JsonValue;
//     begin
//         if InputText = '' then
//             Error('Empty response');

//         JsonObject.ReadFrom(InputText);

//         JsonObject.SelectToken('result', JsonToken);

//         foreach JsonT in JsonToken.AsArray do begin
//             JsonMessage := GetJsonToken(JsonT.AsObject(), 'message');
//             JsonFrom := GetJsonToken(JsonMessage.AsObject(), 'from');

//             TelegramCommand := GetJsonToken(JsonMessage.AsObject(), 'text').AsValue.AsText();
//             TelegramChatID := GetJsonToken(JsonFrom.AsObject(), 'id').AsValue.AsInteger();

//             Insert(TelegramChatID, JsonFrom, TelegramCommand, token);
//         end;
//     end;

//     local procedure Insert(var TelegramChatID: Integer; var JsonFrom: JsonToken; var TelegramCommand: Text; Token: text)
//     var
//         UserSetup: Record "Telegram Users";
//         MessageText: Label 'The user %1 has been correctly configured to receive Workflow notifications.';
//         UserNameToken: JsonToken;
//         UserName: Text;
//         mesage: Text;
//     begin
//         if TelegramCommand.StartsWith('/subscribe') then begin

//             if not JsonFrom.AsObject().Get('username', UserNameToken) then begin
//                 exit;
//             end;

//             UserName := UserNameToken.AsValue.AsText();

//             if UserSetup.Get(TelegramChatID) then begin
//                 UserSetup."Telegram User ID" := UserName;
//                 UserSetup.Modify();
//                 exit;
//             end;
//             UserSetup.Init();
//             UserSetup."Telegram User ID" := UserName;
//             UserSetup."Telegram Chat ID" := TelegramChatID;
//             UserSetup.Id := UserSetup.Count() + 1;
//             UserSetup.Token := Token;
//             UserSetup.Insert();
//             mesage := StrSubstNo(MessageText, UserName);
//             SendMessages(TelegramChatID, mesage);
//         end;
//     end;

//     procedure SendMessages(TelegramChatID: Integer; MessageText: Text);
//     var
//         Client: HttpClient;
//         ResponseMessage: HttpResponseMessage;
//         RequestLabel: Label 'https://api.telegram.org/bot%1/sendMessage?chat_id=%2&text=%3';
//         RequestText: Text;
//     begin

//         if not TelegramSetup.Get() then
//             RequestText := StrSubstNo(RequestLabel, TelegramSetup.Token, TelegramChatID, MessageText);

//         if not Client.Get(RequestText, ResponseMessage) then
//             Error(ResponseMessage.ReasonPhrase);

//         if not ResponseMessage.IsSuccessStatusCode then
//             Error(Format(ResponseMessage.IsSuccessStatusCode));

//     end;

//     procedure SendMessage(TelegramChatID: Integer; MessageText: Text; Id: Integer);
//     var
//         Client: HttpClient;
//         ResponseMessage: HttpResponseMessage;
//         RequestLabel: Label 'https://api.telegram.org/bot%1/sendMessage?chat_id=%2&text=%3';
//         RequestText: Text;
//     begin

//         if UserSetup.find('-') then
//             UserSetup.SetRange("Telegram Chat ID", TelegramChatID);
//         UserSetup.SetRange(Id, Id);

//         case Id of
//             1:
//                 if UserSetup.Get(1) then
//                     RequestText := StrSubstNo(RequestLabel, UserSetup.Token, TelegramChatID, MessageText);
//             2:
//                 if UserSetup.Get(2) then
//                     RequestText := StrSubstNo(RequestLabel, UserSetup.Token, TelegramChatID, MessageText);
//             3:
//                 if UserSetup.Get(3) then
//                     RequestText := StrSubstNo(RequestLabel, UserSetup.Token, TelegramChatID, MessageText);
//             4:
//                 if UserSetup.Get(4) then
//                     RequestText := StrSubstNo(RequestLabel, UserSetup.Token, TelegramChatID, MessageText);
//         end;
//         if not Client.Get(RequestText, ResponseMessage) then
//             Error(ResponseMessage.ReasonPhrase);

//         if not ResponseMessage.IsSuccessStatusCode then
//             Error(Format(ResponseMessage.IsSuccessStatusCode));

//     end;

//     procedure GetJsonToken(JsonObject: JsonObject; TokenKey: text) JsonToken: JsonToken;
//     begin
//         if not JsonObject.Get(TokenKey, JsonToken) then
//             Error('Could not find a token with key %1', TokenKey);
//     end;
// }