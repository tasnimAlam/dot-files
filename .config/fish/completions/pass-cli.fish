# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_pass_cli_global_optspecs
    string join \n h/help V/version
end

function __fish_pass_cli_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_pass_cli_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_pass_cli_using_subcommand
    set -l cmd (__fish_pass_cli_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c pass-cli -n "__fish_pass_cli_needs_command" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -s V -l version -d 'Print version'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "agent" -d 'Manage AI agents'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "login" -d 'Log in (defaults to web login)'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "logout" -d 'Log out of the current session'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "info" -d 'Show information about the current session'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "inject" -d 'Inject secrets into a file templated with secret references'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "run" -d 'Pass secrets as environment variables to an application or script'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "vault" -d 'Vault operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "item" -d 'Item operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "invite" -d 'Invite operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "password" -d 'Password operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "personal-access-token" -d 'Personal Access Token operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "totp" -d 'TOTP operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "share" -d 'Share operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "user" -d 'User operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "session" -d 'Session operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "ssh-agent" -d 'SSH agent operations'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "settings" -d 'Manage persistent settings'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "update" -d 'Check for and install updates'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "support" -d 'Reach to us if you need help'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pass-cli -n "__fish_pass_cli_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "create" -d 'Create a new agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "list" -d 'List all agents'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "delete" -d 'Delete an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "monitor" -d 'List monitor audit entries for an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "access" -d 'Manage agent vault/item access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "renew" -d 'Renew an agent token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "instructions" -d 'Print agent usage instructions (markdown)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and not __fish_seen_subcommand_from create list delete monitor access renew instructions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from create" -l expiration -d 'Expiration (1h, 1d, 1w, 1m, 3m, 6m, 1y)' -r -f -a "1h\t''
1d\t''
1w\t''
1m\t''
3m\t''
6m\t''
1y\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from create" -l vault -d 'Vault name to grant access to (can be repeated)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from monitor" -l limit -d 'Maximum number of records to show' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from monitor" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from monitor" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from access" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from access" -f -a "grant" -d 'Grant vault or item access to an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from access" -f -a "revoke" -d 'Revoke vault access from an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from access" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from renew" -l expiration -d 'New expiration (1h, 1d, 1w, 1m, 3m, 6m, 1y)' -r -f -a "1h\t''
1d\t''
1w\t''
1m\t''
3m\t''
6m\t''
1y\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from renew" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from renew" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from instructions" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all agents'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "monitor" -d 'List monitor audit entries for an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "access" -d 'Manage agent vault/item access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "renew" -d 'Renew an agent token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "instructions" -d 'Print agent usage instructions (markdown)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand agent; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand login" -l pat -d 'Personal access token (format: pst_<token>::<key>)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand login" -l interactive -d 'Use interactive login mode'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand login" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand logout" -l force -d 'Force logout even if remote logout fails'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand logout" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand info" -s o -l output -d 'Output format' -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand info" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand inject" -l file-mode -d 'Set filemode for the output file (Unix systems only). It is ignored without the --out-file flag.' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand inject" -s i -l in-file -d 'The filename of a template file to inject' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand inject" -s o -l out-file -d 'Write the injected template to a file instead of stdout' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand inject" -s f -l force -d 'Do not prompt for confirmation'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand inject" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand run" -l env-file -d 'Enable Dotenv integration with specific Dotenv files to parse' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand run" -l no-masking -d 'Disable masking of secrets on stdout and stderr'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand run" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "list" -d 'List vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "create" -d 'Create a new vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "update" -d 'Update a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "member" -d 'Manage vault members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "delete" -d 'Delete a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "share" -d 'Share a vault with someone'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "transfer" -d 'Transfer the ownership of one of your vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and not __fish_seen_subcommand_from list create update member delete share transfer help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from create" -l name -d 'Name of the vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from update" -l share-id -d 'Share ID of the vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from update" -l vault-name -d 'Name of the vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from update" -l name -d 'New name of the vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from member" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from member" -f -a "list" -d 'List vault members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from member" -f -a "update" -d 'Update a vault member\'s role'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from member" -f -a "remove" -d 'Remove a vault member'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from member" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from delete" -l share-id -d 'Share ID of the vault to delete' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from delete" -l vault-name -d 'Name of the vault to delete' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from share" -l share-id -d 'Share ID of the vault to share' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from share" -l vault-name -d 'Name of the vault to share' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from share" -l role -r -f -a "viewer\t''
editor\t''
manager\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from share" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from transfer" -l share-id -d 'Share ID of the vault to transfer ownership' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from transfer" -l vault-name -d 'Name of the vault to to transfer ownership' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from transfer" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "list" -d 'List vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "member" -d 'Manage vault members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "share" -d 'Share a vault with someone'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "transfer" -d 'Transfer the ownership of one of your vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand vault; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "list" -d 'List items in a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "create" -d 'Create a new item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "delete" -d 'Delete an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "share" -d 'Share an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "view" -d 'View an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "move" -d 'Move an item to a different vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "attachment" -d 'Attachment operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "alias" -d 'Alias operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "member" -d 'Manage item members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "totp" -d 'Generate TOTP code(s) for an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "trash" -d 'Move an item to trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "untrash" -d 'Restore an item from trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "update" -d 'Update an item\'s fields'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and not __fish_seen_subcommand_from list create delete share view move attachment alias member totp trash untrash update help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l share-id -d 'Share ID of the vault to list items from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l vault-name -d 'Name of the vault to list items from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l filter-type -d 'Filter items by type (note, login, alias, credit-card, identity, ssh-key, wifi, custom)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l filter-state -d 'Filter items by state (active, trashed)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l sort-by -d 'Sort items (alphabetic-asc, alphabetic-desc, created-asc, created-desc)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -l show-secrets -d 'Include full item content in JSON output (requires --output json, not allowed with agent sessions)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "login" -d 'Create a new login item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "note" -d 'Create a new note item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "credit-card" -d 'Create a new credit card item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "wifi" -d 'Create a new WiFi item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "custom" -d 'Create a new custom item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "identity" -d 'Create a new identity item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "ssh-key" -d 'Create a new SSH key item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from create" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from delete" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from delete" -l item-id -d 'ID of the item to delete' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from share" -l share-id -d 'Share ID that contains the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from share" -l item-id -d 'ID of the item to share' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from share" -l role -r -f -a "viewer\t''
editor\t''
manager\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from share" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l vault-name -d 'Name of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l item-id -d 'ID of the item to view' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l item-title -d 'Title of the item to view' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l field -d 'Specific field to view' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l from-share-id -d 'Share ID of the source vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l from-vault-name -d 'Name of the source vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l item-id -d 'ID of the item to move' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l item-title -d 'Title of the item to move' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l to-share-id -d 'Share ID of the destination vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -l to-vault-name -d 'Name of the destination vault' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from move" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from attachment" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from attachment" -f -a "download" -d 'Download an attachment'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from attachment" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from alias" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from alias" -f -a "create" -d 'Create a new alias'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from alias" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from member" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from member" -f -a "list" -d 'List item members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from member" -f -a "update" -d 'Update an item member\'s role'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from member" -f -a "remove" -d 'Remove an item member'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from member" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l vault-name -d 'Name of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l item-id -d 'ID of the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l item-title -d 'Title of the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l field -d 'Specific TOTP field to generate code for' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from totp" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from trash" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from trash" -l vault-name -d 'Name of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from trash" -l item-id -d 'ID of the item to trash' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from trash" -l item-title -d 'Title of the item to trash' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from trash" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from untrash" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from untrash" -l vault-name -d 'Name of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from untrash" -l item-id -d 'ID of the item to restore' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from untrash" -l item-title -d 'Title of the item to restore' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from untrash" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -l share-id -d 'Share ID of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -l vault-name -d 'Name of the vault containing the item' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -l item-id -d 'ID of the item to update' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -l item-title -d 'Title of the item to update' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -l field -d 'Field to update in format field_name=field_value (can be specified multiple times)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from update" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "list" -d 'List items in a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "share" -d 'Share an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "view" -d 'View an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "move" -d 'Move an item to a different vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "attachment" -d 'Attachment operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "alias" -d 'Alias operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "member" -d 'Manage item members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "totp" -d 'Generate TOTP code(s) for an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "trash" -d 'Move an item to trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "untrash" -d 'Restore an item from trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "update" -d 'Update an item\'s fields'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand item; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -f -a "list" -d 'List pending invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -f -a "accept" -d 'Accept an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -f -a "reject" -d 'Reject an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -f -a "group" -d 'Operations to perform on group invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and not __fish_seen_subcommand_from list accept reject group help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from accept" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from reject" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from group" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from group" -f -a "list" -d 'List pending invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from group" -f -a "accept" -d 'Accept group invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from group" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from help" -f -a "list" -d 'List pending invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from help" -f -a "accept" -d 'Accept an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from help" -f -a "reject" -d 'Reject an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from help" -f -a "group" -d 'Operations to perform on group invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand invite; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and not __fish_seen_subcommand_from generate score help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and not __fish_seen_subcommand_from generate score help" -f -a "generate" -d 'Generate a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and not __fish_seen_subcommand_from generate score help" -f -a "score" -d 'Score a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and not __fish_seen_subcommand_from generate score help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from generate" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from generate" -f -a "random" -d 'Generate a random password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from generate" -f -a "passphrase" -d 'Generate a passphrase'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from generate" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from score" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from score" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "generate" -d 'Generate a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "score" -d 'Score a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand password; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "create" -d 'Create a new personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "list" -d 'List all personal access tokens'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "delete" -d 'Delete a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "renew" -d 'Renew a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "access" -d 'Manage personal access token access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and not __fish_seen_subcommand_from create list delete renew access help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from create" -l name -d 'Name of the personal access token' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from create" -l expiration -d 'Expiration for the personal access token (1h, 1d, 1w, 1m, 3m, 6m, 1y)' -r -f -a "1h\t''
1d\t''
1w\t''
1m\t''
3m\t''
6m\t''
1y\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from create" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from create" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from delete" -l personal-access-token-id -d 'Personal access token ID to delete' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from delete" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from renew" -l personal-access-token-id -d 'Personal access token ID' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from renew" -l personal-access-token-name -d 'Personal access token name' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from renew" -l expiration -d 'New expiration for the personal access token (1h, 1d, 1w, 1m, 3m, 6m, 1y)' -r -f -a "1h\t''
1d\t''
1w\t''
1m\t''
3m\t''
6m\t''
1y\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from renew" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from renew" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from access" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from access" -f -a "grant" -d 'Grant access to a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from access" -f -a "revoke" -d 'Revoke access from a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from access" -f -a "list-access" -d 'List access grants for a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from access" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "create" -d 'Create a new personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "list" -d 'List all personal access tokens'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "delete" -d 'Delete a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "renew" -d 'Renew a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "access" -d 'Manage personal access token access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand personal-access-token; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and not __fish_seen_subcommand_from generate help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and not __fish_seen_subcommand_from generate help" -f -a "generate" -d 'Generate a TOTP token from a secret or URI'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and not __fish_seen_subcommand_from generate help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and __fish_seen_subcommand_from generate" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and __fish_seen_subcommand_from generate" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and __fish_seen_subcommand_from help" -f -a "generate" -d 'Generate a TOTP token from a secret or URI'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand totp; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and not __fish_seen_subcommand_from list help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and not __fish_seen_subcommand_from list help" -f -a "list" -d 'List available shares'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and not __fish_seen_subcommand_from list help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from list" -l only-items -d 'Only display item shares' -r -f -a "true\t''
false\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from list" -l only-vaults -d 'Only display vault shares' -r -f -a "true\t''
false\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from list" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from list" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from help" -f -a "list" -d 'List available shares'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand share; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and not __fish_seen_subcommand_from info help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and not __fish_seen_subcommand_from info help" -f -a "info" -d 'Show user info'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and not __fish_seen_subcommand_from info help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and __fish_seen_subcommand_from info" -l output -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and __fish_seen_subcommand_from info" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "info" -d 'Show user info'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand user; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -f -a "create-lock" -d 'Create a lock for the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -f -a "lock" -d 'Lock the current session now (requires an existing lock)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -f -a "unlock" -d 'Unlock the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -f -a "remove-lock" -d 'Remove the session lock entirely'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and not __fish_seen_subcommand_from create-lock lock unlock remove-lock help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from create-lock" -l idle-timeout -d 'Time in seconds before the session auto-unlocks (min 30, max 900)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from create-lock" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from lock" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from unlock" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from remove-lock" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "create-lock" -d 'Create a lock for the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "lock" -d 'Lock the current session now (requires an existing lock)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "unlock" -d 'Unlock the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "remove-lock" -d 'Remove the session lock entirely'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand session; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -f -a "start" -d 'Start a Proton Pass SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -f -a "load" -d 'Load SSH keys from Proton Pass into the system SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -f -a "debug" -d 'Debug SSH key items and show why they are or aren\'t usable'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -f -a "daemon" -d 'Manage the SSH agent as a background daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and not __fish_seen_subcommand_from start load debug daemon help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -l socket-path -d 'Path to the SSH agent socket (Unix) or named pipe identifier (Windows)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -l share-id -d 'Share ID of the vault to load keys from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -l vault-name -d 'Name of the vault to load keys from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -l refresh-interval -d 'Interval in seconds to check for new SSH keys in Proton Pass' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -l create-new-identities -d 'Automatically create new SSH key items in the specified vault when identities are added via ssh-add. Specify either a vault name or share ID.' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from start" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from load" -l share-id -d 'Share ID of the vault to load keys from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from load" -l vault-name -d 'Name of the vault to load keys from' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from load" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -l share-id -d 'Share ID of the vault to check' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -l vault-name -d 'Name of the vault to check' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -l item-id -d 'Item ID to check (instead of checking all items)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -l item-title -d 'Item title to check (instead of checking all items)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -s o -l output -d 'Output format' -r -f -a "human\t''
json\t''"
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from debug" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from daemon" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from daemon" -f -a "start" -d 'Start the SSH agent as a background daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from daemon" -f -a "status" -d 'Show the status of the SSH agent daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from daemon" -f -a "stop" -d 'Stop the SSH agent daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from daemon" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from help" -f -a "start" -d 'Start a Proton Pass SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from help" -f -a "load" -d 'Load SSH keys from Proton Pass into the system SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from help" -f -a "debug" -d 'Debug SSH key items and show why they are or aren\'t usable'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from help" -f -a "daemon" -d 'Manage the SSH agent as a background daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand ssh-agent; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and not __fish_seen_subcommand_from view set unset help" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and not __fish_seen_subcommand_from view set unset help" -f -a "view" -d 'View all current settings'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and not __fish_seen_subcommand_from view set unset help" -f -a "set" -d 'Set a setting value'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and not __fish_seen_subcommand_from view set unset help" -f -a "unset" -d 'Unset (clear) a setting'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and not __fish_seen_subcommand_from view set unset help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from view" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from set" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from set" -f -a "default-vault" -d 'Set the default vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from set" -f -a "default-format" -d 'Set the default output format'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from set" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from unset" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from unset" -f -a "default-vault" -d 'Unset the default vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from unset" -f -a "default-format" -d 'Unset the default output format'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from unset" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "view" -d 'View all current settings'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "set" -d 'Set a setting value'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "unset" -d 'Unset (clear) a setting'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand settings; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand update" -l set-track -d 'Change the release track to check updates (default: stable)' -r
complete -c pass-cli -n "__fish_pass_cli_using_subcommand update" -s y -l yes -d 'Skip confirmation prompt'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand update" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand support" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand completions" -s h -l help -d 'Print help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "agent" -d 'Manage AI agents'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "login" -d 'Log in (defaults to web login)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "logout" -d 'Log out of the current session'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "info" -d 'Show information about the current session'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "inject" -d 'Inject secrets into a file templated with secret references'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "run" -d 'Pass secrets as environment variables to an application or script'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "vault" -d 'Vault operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "item" -d 'Item operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "invite" -d 'Invite operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "password" -d 'Password operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "personal-access-token" -d 'Personal Access Token operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "totp" -d 'TOTP operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "share" -d 'Share operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "user" -d 'User operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "session" -d 'Session operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "ssh-agent" -d 'SSH agent operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "settings" -d 'Manage persistent settings'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "update" -d 'Check for and install updates'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "support" -d 'Reach to us if you need help'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "completions" -d 'Generate shell completion scripts'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and not __fish_seen_subcommand_from agent login logout info inject run vault item invite password personal-access-token totp share user session ssh-agent settings update support completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "create" -d 'Create a new agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "list" -d 'List all agents'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "delete" -d 'Delete an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "monitor" -d 'List monitor audit entries for an agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "access" -d 'Manage agent vault/item access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "renew" -d 'Renew an agent token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from agent" -f -a "instructions" -d 'Print agent usage instructions (markdown)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "list" -d 'List vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "create" -d 'Create a new vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "update" -d 'Update a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "member" -d 'Manage vault members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "delete" -d 'Delete a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "share" -d 'Share a vault with someone'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from vault" -f -a "transfer" -d 'Transfer the ownership of one of your vaults'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "list" -d 'List items in a vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "create" -d 'Create a new item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "delete" -d 'Delete an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "share" -d 'Share an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "view" -d 'View an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "move" -d 'Move an item to a different vault'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "attachment" -d 'Attachment operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "alias" -d 'Alias operations'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "member" -d 'Manage item members'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "totp" -d 'Generate TOTP code(s) for an item'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "trash" -d 'Move an item to trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "untrash" -d 'Restore an item from trash'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from item" -f -a "update" -d 'Update an item\'s fields'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from invite" -f -a "list" -d 'List pending invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from invite" -f -a "accept" -d 'Accept an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from invite" -f -a "reject" -d 'Reject an invite'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from invite" -f -a "group" -d 'Operations to perform on group invites'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from password" -f -a "generate" -d 'Generate a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from password" -f -a "score" -d 'Score a password'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from personal-access-token" -f -a "create" -d 'Create a new personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from personal-access-token" -f -a "list" -d 'List all personal access tokens'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from personal-access-token" -f -a "delete" -d 'Delete a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from personal-access-token" -f -a "renew" -d 'Renew a personal access token'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from personal-access-token" -f -a "access" -d 'Manage personal access token access'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from totp" -f -a "generate" -d 'Generate a TOTP token from a secret or URI'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from share" -f -a "list" -d 'List available shares'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from user" -f -a "info" -d 'Show user info'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "create-lock" -d 'Create a lock for the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "lock" -d 'Lock the current session now (requires an existing lock)'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "unlock" -d 'Unlock the current session with a lock code'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from session" -f -a "remove-lock" -d 'Remove the session lock entirely'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from ssh-agent" -f -a "start" -d 'Start a Proton Pass SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from ssh-agent" -f -a "load" -d 'Load SSH keys from Proton Pass into the system SSH agent'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from ssh-agent" -f -a "debug" -d 'Debug SSH key items and show why they are or aren\'t usable'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from ssh-agent" -f -a "daemon" -d 'Manage the SSH agent as a background daemon'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "view" -d 'View all current settings'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "set" -d 'Set a setting value'
complete -c pass-cli -n "__fish_pass_cli_using_subcommand help; and __fish_seen_subcommand_from settings" -f -a "unset" -d 'Unset (clear) a setting'
