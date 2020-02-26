$mailboxes = Get-Mailbox -ResultSize unlimited

$forwardingRules = @()

foreach ($mailbox in $mailboxes){
    $rules = Get-InboxRule -mailbox $mailbox.id

    foreach ($rule in $rules){
        if ($rule.forwardto -ne $null){
            $forwardingRules += $rule
        }
    }
}

# https://www.slipstick.com/exchange/prevent-users-from-forwarding-mail-to-internet-addresses/