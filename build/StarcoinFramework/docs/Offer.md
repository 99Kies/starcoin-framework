
<a name="0x1_Offer"></a>

# Module `0x1::Offer`



-  [Resource `Offer`](#0x1_Offer_Offer)
-  [Resource `Offers`](#0x1_Offer_Offers)
-  [Struct `OfferInfo`](#0x1_Offer_OfferInfo)
-  [Constants](#@Constants_0)
-  [Function `create`](#0x1_Offer_create)
-  [Function `create_v2`](#0x1_Offer_create_v2)
-  [Function `create_offers`](#0x1_Offer_create_offers)
-  [Function `push`](#0x1_Offer_push)
-  [Function `redeem`](#0x1_Offer_redeem)
-  [Function `redeem_v2`](#0x1_Offer_redeem_v2)
-  [Function `exists_at`](#0x1_Offer_exists_at)
-  [Function `exists_at_v2`](#0x1_Offer_exists_at_v2)
-  [Function `address_of`](#0x1_Offer_address_of)
-  [Function `address_of_v2`](#0x1_Offer_address_of_v2)
-  [Function `retake`](#0x1_Offer_retake)
-  [Function `get_offers_infos`](#0x1_Offer_get_offers_infos)
-  [Function `get_offers_info`](#0x1_Offer_get_offers_info)
-  [Function `unpack_offer_info`](#0x1_Offer_unpack_offer_info)
-  [Function `get_offers_length`](#0x1_Offer_get_offers_length)
-  [Function `is_offers_empty`](#0x1_Offer_is_offers_empty)
-  [Function `take_offer`](#0x1_Offer_take_offer)
-  [Function `find_offer`](#0x1_Offer_find_offer)
-  [Module Specification](#@Module_Specification_1)


<pre><code><b>use</b> <a href="Errors.md#0x1_Errors">0x1::Errors</a>;
<b>use</b> <a href="Option.md#0x1_Option">0x1::Option</a>;
<b>use</b> <a href="Signer.md#0x1_Signer">0x1::Signer</a>;
<b>use</b> <a href="Timestamp.md#0x1_Timestamp">0x1::Timestamp</a>;
<b>use</b> <a href="Vector.md#0x1_Vector">0x1::Vector</a>;
</code></pre>



<a name="0x1_Offer_Offer"></a>

## Resource `Offer`

A wrapper around value <code>offered</code> that can be claimed by the address stored in <code>for</code> when after lock time.


<pre><code><b>struct</b> <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; <b>has</b> store, key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>offered: Offered</code>
</dt>
<dd>

</dd>
<dt>
<code>for: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>time_lock: u64</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x1_Offer_Offers"></a>

## Resource `Offers`



<pre><code><b>struct</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered: store&gt; <b>has</b> key
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>offers: vector&lt;<a href="Offer.md#0x1_Offer_Offer">Offer::Offer</a>&lt;Offered&gt;&gt;</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="0x1_Offer_OfferInfo"></a>

## Struct `OfferInfo`



<pre><code><b>struct</b> <a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a> <b>has</b> <b>copy</b>, drop, store
</code></pre>



<details>
<summary>Fields</summary>


<dl>
<dt>
<code>for: <b>address</b></code>
</dt>
<dd>

</dd>
<dt>
<code>time_lock: u64</code>
</dt>
<dd>

</dd>
</dl>


</details>

<a name="@Constants_0"></a>

## Constants


<a name="0x1_Offer_EOFFER_DNE_FOR_ACCOUNT"></a>

An offer of the specified type for the account does not match


<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_DNE_FOR_ACCOUNT">EOFFER_DNE_FOR_ACCOUNT</a>: u64 = 101;
</code></pre>



<a name="0x1_Offer_EOFFER_HAVE_OFFER"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_HAVE_OFFER">EOFFER_HAVE_OFFER</a>: u64 = 106;
</code></pre>



<a name="0x1_Offer_EOFFER_NOT_HAVE_OFFER"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>: u64 = 105;
</code></pre>



<a name="0x1_Offer_EOFFER_NOT_UNLOCKED"></a>

Offer is not unlocked yet.


<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_NOT_UNLOCKED">EOFFER_NOT_UNLOCKED</a>: u64 = 102;
</code></pre>



<a name="0x1_Offer_EOFFER_OFFERS_ARG_LEN_NOT_SAME"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_OFFERS_ARG_LEN_NOT_SAME">EOFFER_OFFERS_ARG_LEN_NOT_SAME</a>: u64 = 104;
</code></pre>



<a name="0x1_Offer_EOFFER_OFFERS_EMPTY"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_OFFERS_EMPTY">EOFFER_OFFERS_EMPTY</a>: u64 = 107;
</code></pre>



<a name="0x1_Offer_EOFFER_OFFERS_ZERO"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_EOFFER_OFFERS_ZERO">EOFFER_OFFERS_ZERO</a>: u64 = 103;
</code></pre>



<a name="0x1_Offer_ERR_DEPRECATED"></a>



<pre><code><b>const</b> <a href="Offer.md#0x1_Offer_ERR_DEPRECATED">ERR_DEPRECATED</a>: u64 = 1;
</code></pre>



<a name="0x1_Offer_create"></a>

## Function `create`

Publish a value of type <code>Offered</code> under the sender's account. The value can be claimed by
either the <code>for</code> address or the transaction sender.


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create">create</a>&lt;Offered: store&gt;(account: &signer, offered: Offered, for: <b>address</b>, lock_period: u64)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create">create</a>&lt;Offered: store&gt;(account: &signer, offered: Offered, for: <b>address</b>, lock_period: u64) <b>acquires</b> <a href="Offer.md#0x1_Offer">Offer</a>, <a href="Offer.md#0x1_Offer_Offers">Offers</a>{
    <b>let</b> time_lock = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>() + lock_period;
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address)){
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address).offers;
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(offers, <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock });
    }<b>else</b> {
        <b>let</b> offers = <a href="Vector.md#0x1_Vector_empty">Vector::empty</a>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;();
        <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address)){
            <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offers, <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address));
        };
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offers, <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock });
        <b>move_to</b>(account, <a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt; { offers });
    }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>include</b> <a href="Timestamp.md#0x1_Timestamp_AbortsIfTimestampNotExists">Timestamp::AbortsIfTimestampNotExists</a>;
<b>aborts_if</b> <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>() + lock_period &gt; max_u64();
<b>aborts_if</b> <b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(<a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account));
</code></pre>



</details>

<a name="0x1_Offer_create_v2"></a>

## Function `create_v2`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create_v2">create_v2</a>&lt;Offered: store&gt;(account: &signer, offered: Offered, for: <b>address</b>, lock_period: u64)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create_v2">create_v2</a>&lt;Offered: store&gt;(account: &signer, offered: Offered, for: <b>address</b>, lock_period: u64) <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>, <a href="Offer.md#0x1_Offer">Offer</a>{
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>let</b> time_lock = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>() + lock_period;

    <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address)){
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address).offers;
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(offers, <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock });
    }<b>else</b> {
        <b>let</b> offers = <a href="Vector.md#0x1_Vector_empty">Vector::empty</a>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;();
        <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address)){
            <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offers, <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address));
        };
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offers, <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock });
        <b>move_to</b>(account, <a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt; { offers });
    };
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_create_offers"></a>

## Function `create_offers`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create_offers">create_offers</a>&lt;Offered: store&gt;(account: &signer, offereds: vector&lt;Offered&gt;, for: vector&lt;<b>address</b>&gt;, lock_periods: vector&lt;u64&gt;)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_create_offers">create_offers</a>&lt;Offered: store&gt;(account: &signer, offereds: vector&lt;Offered&gt;, for: vector&lt;<b>address</b>&gt;, lock_periods: vector&lt;u64&gt;) <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>, <a href="Offer.md#0x1_Offer">Offer</a> {
    <b>let</b> offer_length = <a href="Vector.md#0x1_Vector_length">Vector::length</a>(&offereds);
    <b>assert</b>!(offer_length &gt; 0, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_OFFERS_ZERO">EOFFER_OFFERS_ZERO</a>));
    <b>assert</b>!(offer_length == <a href="Vector.md#0x1_Vector_length">Vector::length</a>(&for) && offer_length == <a href="Vector.md#0x1_Vector_length">Vector::length</a>(&lock_periods), <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_OFFERS_ARG_LEN_NOT_SAME">EOFFER_OFFERS_ARG_LEN_NOT_SAME</a>));
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);

    <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address)){
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address).offers;
        <a href="Offer.md#0x1_Offer_push">push</a>(offers, offereds, for, lock_periods);
    }<b>else</b> {
        <b>let</b> offers = <a href="Vector.md#0x1_Vector_empty">Vector::empty</a>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;();
        <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address)){
            <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offers, <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address));
        };
        <a href="Offer.md#0x1_Offer_push">push</a>(&<b>mut</b> offers, offereds, for, lock_periods);
        <b>move_to</b>(account, <a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt; { offers });
    };
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_push"></a>

## Function `push`



<pre><code><b>fun</b> <a href="Offer.md#0x1_Offer_push">push</a>&lt;Offered: store&gt;(offers: &<b>mut</b> vector&lt;<a href="Offer.md#0x1_Offer_Offer">Offer::Offer</a>&lt;Offered&gt;&gt;, offereds: vector&lt;Offered&gt;, for: vector&lt;<b>address</b>&gt;, lock_periods: vector&lt;u64&gt;)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>fun</b> <a href="Offer.md#0x1_Offer_push">push</a>&lt;Offered: store&gt;(offers: &<b>mut</b> vector&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;, offereds: vector&lt;Offered&gt;, for: vector&lt;<b>address</b>&gt;, lock_periods: vector&lt;u64&gt;){
    <b>let</b> now = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>();
    <b>let</b> offer_length = <a href="Vector.md#0x1_Vector_length">Vector::length</a>(&offereds);

    <b>let</b> i = offer_length - 1;
    <b>loop</b>{
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(offers, <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; {
            offered: <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(&<b>mut</b> offereds, i),
            for: <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(&<b>mut</b> for, i),
            time_lock: now + <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(&<b>mut</b> lock_periods, i)
        });
        <b>if</b>(i == 0){
            <b>break</b>
        };
        i = i - 1;
    };
    <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(offereds);
    <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(for);
    <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(lock_periods);
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_redeem"></a>

## Function `redeem`

Claim the value of type <code>Offered</code> published at <code>offer_address</code>.
Only succeeds if the sender is the intended recipient stored in <code>for</code> or the original
publisher <code>offer_address</code>, and now >= time_lock
Also fails if no such value exists.


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_redeem">redeem</a>&lt;Offered: store&gt;(account: &signer, offer_address: <b>address</b>): Offered
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_redeem">redeem</a>&lt;Offered: store&gt;(account: &signer, offer_address: <b>address</b>): Offered <b>acquires</b> <a href="Offer.md#0x1_Offer">Offer</a>, <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>let</b> <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock } = <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address)){
        <b>let</b> op_index = <a href="Offer.md#0x1_Offer_find_offer">find_offer</a>&lt;Offered&gt;(offer_address, account_address);
        <b>assert</b>!(<a href="Option.md#0x1_Option_is_some">Option::is_some</a>(&op_index),<a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_DNE_FOR_ACCOUNT">EOFFER_DNE_FOR_ACCOUNT</a>));
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
        <b>let</b> index = <a href="Option.md#0x1_Option_destroy_some">Option::destroy_some</a>(op_index);
        <b>let</b> offer = <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(offers , index);
        <b>if</b>(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) == 0){
            <b>let</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a> { offers } = <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address);
            <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(offers);
        };
        offer
    }<b>else</b> <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address)){
        <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address)
    }<b>else</b>{
        <b>abort</b> <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>)
    };

    <b>let</b> now = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>();
    <b>assert</b>!(account_address == for || account_address == offer_address, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_DNE_FOR_ACCOUNT">EOFFER_DNE_FOR_ACCOUNT</a>));
    <b>assert</b>!(now &gt;= time_lock, <a href="Errors.md#0x1_Errors_not_published">Errors::not_published</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_UNLOCKED">EOFFER_NOT_UNLOCKED</a>));
    offered
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> !<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address);
<b>aborts_if</b> <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account) != <b>global</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address).for && <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account) != offer_address;
<b>aborts_if</b> <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>() &lt; <b>global</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address).time_lock;
<b>include</b> <a href="Timestamp.md#0x1_Timestamp_AbortsIfTimestampNotExists">Timestamp::AbortsIfTimestampNotExists</a>;
</code></pre>



</details>

<a name="0x1_Offer_redeem_v2"></a>

## Function `redeem_v2`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_redeem_v2">redeem_v2</a>&lt;Offered: store&gt;(account: &signer, offer_address: <b>address</b>, idx: u64): Offered
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_redeem_v2">redeem_v2</a>&lt;Offered: store&gt;(account: &signer, offer_address: <b>address</b>, idx: u64): Offered <b>acquires</b> <a href="Offer.md#0x1_Offer">Offer</a>, <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>let</b> <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered, for, time_lock } = <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address)){
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
        <b>assert</b>!(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) - 1 &gt;= idx, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
        <b>let</b> offer = <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(offers, idx);
        <b>if</b>(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) == 0){
            <b>let</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a> { offers } = <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address);
            <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(offers);
        };
        offer
    }<b>else</b> <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address)){
        <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address)
    }<b>else</b>{
        <b>abort</b> <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>)
    };

    <b>let</b> now = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>();
    <b>assert</b>!(account_address == for || account_address == offer_address, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_DNE_FOR_ACCOUNT">EOFFER_DNE_FOR_ACCOUNT</a>));
    <b>assert</b>!(now &gt;= time_lock, <a href="Errors.md#0x1_Errors_not_published">Errors::not_published</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_UNLOCKED">EOFFER_NOT_UNLOCKED</a>));
    offered
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_exists_at"></a>

## Function `exists_at`

Returns true if an offer of type <code>Offered</code> exists at <code>offer_address</code>.


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_exists_at">exists_at</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_exists_at">exists_at</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool {
    <b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address) || <b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_exists_at_v2"></a>

## Function `exists_at_v2`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool{
    <b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_address_of"></a>

## Function `address_of`

Returns the address of the <code>Offered</code> type stored at <code>offer_address</code>.
Fails if no such <code><a href="Offer.md#0x1_Offer">Offer</a></code> exists.


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_address_of">address_of</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): <b>address</b>
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_address_of">address_of</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): <b>address</b> <b>acquires</b> <a href="Offer.md#0x1_Offer">Offer</a>, <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address)){
        <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address).for
    }<b>else</b>{
        <b>assert</b>!(!<a href="Offer.md#0x1_Offer_is_offers_empty">is_offers_empty</a>&lt;Offered&gt;(offer_address), <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_OFFERS_EMPTY">EOFFER_OFFERS_EMPTY</a>));
        <a href="Offer.md#0x1_Offer_address_of_v2">address_of_v2</a>&lt;Offered&gt;(offer_address, <a href="Offer.md#0x1_Offer_get_offers_length">get_offers_length</a>&lt;Offered&gt;(offer_address) - 1)
    }

}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>aborts_if</b> !<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(offer_address);
<b>aborts_if</b> !<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address);
</code></pre>



</details>

<a name="0x1_Offer_address_of_v2"></a>

## Function `address_of_v2`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_address_of_v2">address_of_v2</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, idx: u64): <b>address</b>
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_address_of_v2">address_of_v2</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, idx: u64): <b>address</b> <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>assert</b>!(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address), <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
    <b>let</b> offers = & <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
    <b>assert</b>!(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) - 1 &gt;= idx, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
    <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, idx).for
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_retake"></a>

## Function `retake`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_retake">retake</a>&lt;Offered: store&gt;(account: &signer, idx: u64): Offered
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_retake">retake</a>&lt;Offered: store&gt;(account: &signer, idx: u64): Offered <b>acquires</b> <a href="Offer.md#0x1_Offer">Offer</a>, <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>let</b> account_address = <a href="Signer.md#0x1_Signer_address_of">Signer::address_of</a>(account);
    <b>let</b> <a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt; { offered: offered, for: _, time_lock: time_lock } = <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address)){
        <b>let</b> offers = &<b>mut</b> <b>borrow_global_mut</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address).offers;
        <b>assert</b>!(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) - 1 &gt;= idx, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
        <b>let</b> offer = <a href="Vector.md#0x1_Vector_remove">Vector::remove</a>(offers, idx);
        <b>if</b>(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) == 0){
            <b>let</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a> { offers } = <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(account_address);
            <a href="Vector.md#0x1_Vector_destroy_empty">Vector::destroy_empty</a>(offers);
        };
        offer
    }<b>else</b> <b>if</b>(<b>exists</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address)){
        <b>move_from</b>&lt;<a href="Offer.md#0x1_Offer">Offer</a>&lt;Offered&gt;&gt;(account_address)
    }<b>else</b>{
        <b>abort</b> <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>)
    };
    <b>let</b> now = <a href="Timestamp.md#0x1_Timestamp_now_seconds">Timestamp::now_seconds</a>();
    <b>assert</b>!(now &gt;= time_lock + ( 3600 * 24 * 30 * 3 ), <a href="Errors.md#0x1_Errors_not_published">Errors::not_published</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_UNLOCKED">EOFFER_NOT_UNLOCKED</a>));
    offered
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_get_offers_infos"></a>

## Function `get_offers_infos`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_infos">get_offers_infos</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): <a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;vector&lt;<a href="Offer.md#0x1_Offer_OfferInfo">Offer::OfferInfo</a>&gt;&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_infos">get_offers_infos</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): <a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;vector&lt;<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>&gt;&gt; <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>{
    <b>if</b>(!<a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered&gt;(offer_address)){
        <b>return</b> <a href="Option.md#0x1_Option_none">Option::none</a>&lt;vector&lt;<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>&gt;&gt;()
    };
    <b>let</b> offers = & <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
    <b>let</b> offer_infos = <a href="Vector.md#0x1_Vector_empty">Vector::empty</a>&lt;<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>&gt;();
    <b>let</b> i = 0;
    <b>let</b> length = <a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers);
    <b>while</b>(i &lt; length){
        <a href="Vector.md#0x1_Vector_push_back">Vector::push_back</a>(&<b>mut</b> offer_infos, <a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a> { for: <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, i).for, time_lock: <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, i).time_lock });
        i = i + 1;
    };
    <a href="Option.md#0x1_Option_some">Option::some</a>(offer_infos)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_get_offers_info"></a>

## Function `get_offers_info`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_info">get_offers_info</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, idx: u64): <a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;<a href="Offer.md#0x1_Offer_OfferInfo">Offer::OfferInfo</a>&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_info">get_offers_info</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, idx: u64): <a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>&gt; <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>{
    <b>if</b>(!<a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered&gt;(offer_address)){
        <b>return</b> <a href="Option.md#0x1_Option_none">Option::none</a>&lt;<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>&gt;()
    };
    <b>let</b> offers = & <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
    <b>assert</b>!(<a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers) &gt;= idx, <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
    <a href="Option.md#0x1_Option_some">Option::some</a>(<a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a> { for: <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, idx).for, time_lock: <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, idx).time_lock })
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_unpack_offer_info"></a>

## Function `unpack_offer_info`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_unpack_offer_info">unpack_offer_info</a>(offer_info: <a href="Offer.md#0x1_Offer_OfferInfo">Offer::OfferInfo</a>): (<b>address</b>, u64)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_unpack_offer_info">unpack_offer_info</a>(offer_info: <a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>):(<b>address</b>, u64){
    <b>let</b> <a href="Offer.md#0x1_Offer_OfferInfo">OfferInfo</a>{ for, time_lock } = offer_info;
    ( for, time_lock )
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_get_offers_length"></a>

## Function `get_offers_length`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_length">get_offers_length</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): u64
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_get_offers_length">get_offers_length</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): u64 <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>{
    <b>assert</b>!(<a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered&gt;(offer_address), <a href="Errors.md#0x1_Errors_invalid_argument">Errors::invalid_argument</a>(<a href="Offer.md#0x1_Offer_EOFFER_NOT_HAVE_OFFER">EOFFER_NOT_HAVE_OFFER</a>));
    <b>let</b> offers = & <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
    <a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_is_offers_empty"></a>

## Function `is_offers_empty`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_is_offers_empty">is_offers_empty</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_is_offers_empty">is_offers_empty</a>&lt;Offered: store&gt;(offer_address: <b>address</b>): bool <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a>{
    <b>if</b>( <a href="Offer.md#0x1_Offer_get_offers_length">get_offers_length</a>&lt;Offered&gt;(offer_address) == 0){
        <b>true</b>
    }<b>else</b>{
        <b>false</b>
    }
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_take_offer"></a>

## Function `take_offer`

Take Offer and put to signer's Collection<Offered>.


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="Offer.md#0x1_Offer_take_offer">take_offer</a>&lt;Offered: store&gt;(_signer: signer, _offer_address: <b>address</b>)
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b>(<b>script</b>) <b>fun</b> <a href="Offer.md#0x1_Offer_take_offer">take_offer</a>&lt;Offered: store&gt;(_signer: signer, _offer_address: <b>address</b>){
    <b>abort</b> <a href="Errors.md#0x1_Errors_invalid_state">Errors::invalid_state</a>(<a href="Offer.md#0x1_Offer_ERR_DEPRECATED">ERR_DEPRECATED</a>)
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="0x1_Offer_find_offer"></a>

## Function `find_offer`



<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_find_offer">find_offer</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, for: <b>address</b>): <a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;u64&gt;
</code></pre>



<details>
<summary>Implementation</summary>


<pre><code><b>public</b> <b>fun</b> <a href="Offer.md#0x1_Offer_find_offer">find_offer</a>&lt;Offered: store&gt;(offer_address: <b>address</b>, for: <b>address</b>):<a href="Option.md#0x1_Option_Option">Option::Option</a>&lt;u64&gt; <b>acquires</b> <a href="Offer.md#0x1_Offer_Offers">Offers</a> {
    <b>if</b>(!<a href="Offer.md#0x1_Offer_exists_at_v2">exists_at_v2</a>&lt;Offered&gt;(offer_address)){
        <b>return</b> <a href="Option.md#0x1_Option_none">Option::none</a>&lt;u64&gt;()
    };
    <b>let</b> offers = & <b>borrow_global</b>&lt;<a href="Offer.md#0x1_Offer_Offers">Offers</a>&lt;Offered&gt;&gt;(offer_address).offers;
    <b>let</b> length = <a href="Vector.md#0x1_Vector_length">Vector::length</a>(offers);
    <b>let</b> i = 0;
    <b>while</b>(i &lt; length){
        <b>let</b> offer = <a href="Vector.md#0x1_Vector_borrow">Vector::borrow</a>(offers, i);
        <b>if</b>( offer.for == for ){
            <b>return</b> <a href="Option.md#0x1_Option_some">Option::some</a>(i)
        };
        i = i + 1;
    };
    <a href="Option.md#0x1_Option_none">Option::none</a>&lt;u64&gt;()
}
</code></pre>



</details>

<details>
<summary>Specification</summary>



<pre><code><b>pragma</b> verify = <b>false</b>;
</code></pre>



</details>

<a name="@Module_Specification_1"></a>

## Module Specification



<pre><code><b>pragma</b> verify = <b>false</b>;
<b>pragma</b> aborts_if_is_strict = <b>true</b>;
</code></pre>
