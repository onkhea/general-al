codeunit 50655 "Telegram Event"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, Database::"Approval Entry", 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertEvent(var Rec: Record "Approval Entry"; RunTrigger: Boolean)
    var
        Telegram: codeunit Telegrams;
        UserSetupFrom: Record "User Setup";
        TelegramUsers: Record "Workflow User Group Member";
        WorkGroup: Record "Workflow User Group";
        MessageText: Text;
        Https: Text;
        MessageLabel: Label 'The user %1 requires your approval in the company %2 for the following document: %3 link:%4';
    begin
        if not RunTrigger then begin
            exit;
        end;
        Https := 'http://192.168.0.194:200/?tenant=default&page=654&filter=%27Approval%20Entry%27.Status%20IS%20%271%27&company=CRONUS%20BACKUP%20TEST%20230124&dc=0';
        MessageText := StrSubstNo(MessageLabel, Rec."Sender ID", COMPANYNAME, GetType(Rec));
        if TelegramUsers.Find('-') then
            TelegramUsers.SetRange("Approval User ID", Rec."Approver ID");
              if TelegramUsers.Find('-') then
            TelegramUsers.SetRange(Id, Rec."Table ID");
        if TelegramUsers.find('-') then begin
            repeat
                 Telegram.SendMessage(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code", TelegramUsers.Token, TelegramUsers.Id, TelegramUsers."Telegram User ID");
            until TelegramUsers.Next() = 0;
        end else begin
                      Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
        end;
        // case Rec."Table ID" of
        //     36:
        //         if TelegramUsers.find('-') then begin
        //             TelegramUsers.SetRange("Workflow User Group Code", WorkGroup.Code);
        //             WorkGroup.SetRange("Table ID", Rec."Table ID");
        //             repeat
        //                 Telegram.SendMessage(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
        //             until TelegramUsers.Next() = 0;
        //         end else begin
        //             Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
        //         end;
        //     38:
        //         if TelegramUsers.Find('-') then begin
        //             repeat
        //                 Telegram.SendMessage(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
        //             until TelegramUsers.Next() = 0;
        //         end else begin
        //             Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
        //         end;
        //     23:
        //         if TelegramUsers.Find('-') then begin
        //             repeat
        //                 Telegram.SendMessage(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
        //             until TelegramUsers.Next() = 0;
        //         end else begin
        //             Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
        //         end;
        // end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnApproveApprovalRequest', '', true, true)]
    local procedure OnApproveApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
        SendTelegramNotifition(ApprovalEntry);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnAfterRejectSelectedApprovalRequest', '', true, true)]
    local procedure OnAfterRejectSelectedApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    begin
        SendTelegramNotifition(ApprovalEntry);
    end;

    local procedure SendTelegramNotifition(var ApprovalEntry: Record "Approval Entry")
    var
        Telegram: codeunit Telegrams;
        TelegramUsers:
                Record "Workflow User Group Member";
        MessageText:
                Text;
        MessageRequest:
                Label 'User %1 has approval document %2 in company %3';
        MessageApproval:
                Label 'User %1 has approval document %2 in company %3';
        MessageReject:
                Label 'User %1 has %2 document %3 in company %4';

    begin
        case ApprovalEntry.Status of
            "Approval Status"::Open:
                MessageText := StrSubstNo(MessageApproval, ApprovalEntry."Approver ID", ApprovalEntry.Status, COMPANYNAME, GetType(ApprovalEntry));
            "Approval Status"::Approved:
                MessageText := StrSubstNo(MessageApproval, ApprovalEntry."Approver ID", ApprovalEntry.Status, COMPANYNAME, GetType(ApprovalEntry));
            "Approval Status"::Rejected:
                MessageText := StrSubstNo(MessageReject, ApprovalEntry."Approver ID", ApprovalEntry.Status, COMPANYNAME, GetType(ApprovalEntry));
        end;
        TelegramUsers.Reset();
        TelegramUsers.SetRange("Approval User ID", ApprovalEntry."Sender ID");
        case ApprovalEntry."Table ID" of
            36:
                if TelegramUsers.Get() then begin
                    repeat
                        Telegram.SendMessageApp(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
                    until TelegramUsers.Next() = 0;
                end else begin
                    Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
                end;
            38:
                if TelegramUsers.Get() then begin
                    repeat
                        Telegram.SendMessageApp(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
                    until TelegramUsers.Next() = 0;
                end else begin
                    Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
                end;
            23:
                if TelegramUsers.Get() then begin
                    repeat
                        Telegram.SendMessageApp(TelegramUsers."Telegram Chat ID", MessageText, TelegramUsers."Workflow User Group Code");
                    until TelegramUsers.Next() = 0;
                end else begin
                    Message('The message to Telegram  %1 \ could not be sent, the user was not found in the Telegram Setup table.', MessageText);
                end;
        end;
    end;

    procedure GetType(Rec: Record "Approval Entry"): Text
    var
        BankAccHeader: Record "Bank Acc. Reconciliation";
        GenJournalBatch: Record "Gen. Journal Batch";
        GenJournalLine: Record "Gen. Journal Line";
        ReversalEntry: Record "Reversal Entry";
        GenLedgerRegister: Record "G/L Register";
        PurchaseHeader: Record "Purchase Header";
        SalesHeader: Record "Sales Header";
        Vendor: Record Vendor;
    begin
        Case Rec."Table ID" of
            Database::"Reversal Entry":
                begin
                    ReversalEntry.Get(Rec."Record ID to Approve");
                    exit('Reversal Entry: ' + ReversalEntry."Document No.");
                end;
            Database::"G/L Register":
                begin
                    GenLedgerRegister.Get(Rec."Record ID to Approve");
                    exit('GenLedgerRegister: ' + Format(GenLedgerRegister."No."));
                end;
            Database::"Gen. Journal Batch":
                begin
                    if GenJournalBatch.Get(Rec."Record ID to Approve") then begin
                        exit('Gen. Journal Batch: ' + GenJournalBatch.Name
                        + ' | Journal Template Name ' + GenJournalBatch."Journal Template Name");
                    end;
                end;
            Database::"Bank Acc. Reconciliation":
                begin
                    BankAccHeader.Get(Rec."Record ID to Approve");
                    exit('Bank Acc. Reconciliation: ' + Format(BankAccHeader."Bank Account No."));
                end;
            Database::"Purchase Header":
                begin
                    PurchaseHeader.Get(Rec."Record ID to Approve");
                    exit('Purchase ' + Format(PurchaseHeader."Document Type") + ' ' + Format(PurchaseHeader."No."));
                end;
            Database::"Sales Header":
                begin
                    SalesHeader.Get(Rec."Record ID to Approve");
                    exit('Sales ' + Format(SalesHeader."Document Type") + ' ' + Format(SalesHeader."No."));
                end;
            Database::Vendor:
                begin
                    Vendor.Get(Rec."Record ID to Approve");
                    exit('Vendor' + Format(Vendor.Name) + '' + Format(Vendor."No."));
                end;
        end
    end;

}