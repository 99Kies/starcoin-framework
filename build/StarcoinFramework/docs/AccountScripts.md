
<a name="0x1_AccountScripts"></a>

# Module `0x1::AccountScripts`



-  [Function `enable_auto_accept_token`](#0x1_AccountScripts_enable_auto_accept_token)
-  [Function `disable_auto_accept_token`](#0x1_AccountScripts_disable_auto_accept_token)
-  [Function `remove_zero_balance`](#0x1_AccountScripts_remove_zero_balance)


<pre><code><b>use</b> <a href="Account.md#0x1_Account">0x1::Account</a>;
</code></pre>



<a name="0x1_AccountScripts_enable_auto_accept_token"></a>

## Function `enable_auto_accept_token`

Enable account's auto-accept-token feature.
The script function is reenterable.


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_enable_auto_accept_token">enable_auto_accept_token</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_enable_auto_accept_token">enable_auto_accept_token</a>(account: signer) {
    <a href="Account.md#0x1_Account_set_auto_accept_token_entry">Account::set_auto_accept_token_entry</a>(account, <b>true</b>);
}
</code></pre>



</details>

<a name="0x1_AccountScripts_disable_auto_accept_token"></a>

## Function `disable_auto_accept_token`

Disable account's auto-accept-token feature.
The script function is reenterable.


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_disable_auto_accept_token">disable_auto_accept_token</a>(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_disable_auto_accept_token">disable_auto_accept_token</a>(account: signer) {
    <a href="Account.md#0x1_Account_set_auto_accept_token_entry">Account::set_auto_accept_token_entry</a>(account, <b>false</b>);
}
</code></pre>



</details>

<a name="0x1_AccountScripts_remove_zero_balance"></a>

## Function `remove_zero_balance`

Remove zero Balance


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_remove_zero_balance">remove_zero_balance</a>&lt;TokenType: store&gt;(account: signer)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="AccountScripts.md#0x1_AccountScripts_remove_zero_balance">remove_zero_balance</a>&lt;TokenType: store&gt;(account: signer) {
    <a href="Account.md#0x1_Account_remove_zero_balance_entry">Account::remove_zero_balance_entry</a>&lt;TokenType&gt;(account);
}
</code></pre>



</details>
