//# init -n dev

//# faucet --addr Genesis --amount 1000000000000000

//# faucet --addr alice --amount 1000000000000000

//# block --author 0x1 --timestamp 86400000

//# run --signers alice
script {
    use StarcoinFramework::StakeToSBTPlugin;
    use StarcoinFramework::STC;
    use StarcoinFramework::Token;
    use StarcoinFramework::Account;
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;

    fun stake_and_check(sender: signer) {
        let token = Account::withdraw<STC::STC>(
            &sender, 1000 * Token::scaling_factor<STC::STC>());
        StakeToSBTPlugin::install_event<StarcoinDAO>();
        StakeToSBTPlugin::stake<StarcoinDAO, STC::STC>(&sender, token, 60000);
    }
}
// check: EXECUTED

//# block --author 0x1 --timestamp 86401000

//# block --author 0x1 --timestamp 86402000

//# call-api chain.info

//# run --signers alice --args {{$.call-api[0].head.parent_hash}}
script {
    use StarcoinFramework::Block;

    fun checkpoint(_account: signer, parent_hash: vector<u8>) {
        let expect_parent_hash = Block::get_parent_hash();
        assert!(expect_parent_hash == parent_hash, 1001);

        Block::checkpoint();
    }
}
// check: EXECUTED


//# block --author=0x3 --timestamp 86450000

//# call-api chain.get_block_by_hash ["{{$.call-api[0].head.parent_hash}}",{"raw":true}]

//# run --signers alice  --args {{$.call-api[1].raw.header}}

script {
    use StarcoinFramework::Block;

    fun update(_account: signer, raw_header: vector<u8>) {
        Block::update_state_root(raw_header);
    }
}
// check: EXECUTED

//# package
module Genesis::test {
    public fun hello() {}
}

//# run --signers alice --args {{$.package[0].package_hash}}
script{
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;
    use StarcoinFramework::UpgradeModulePlugin;

    //alice create proposal
    fun create_proposal(sender: signer, package_hash: vector<u8>){
        UpgradeModulePlugin::create_proposal<StarcoinDAO>(&sender, b"Upgrade module", 10000, package_hash, 1, true);
    }
}
// check: EXECUTED


//# block --author=0x3 --timestamp 86520000

//# call 0x1::SnapshotUtil::get_access_path --type-args 0x1::StarcoinDAO::StarcoinDAO --args {{$.faucet[1].txn.raw_txn.decoded_payload.ScriptFunction.args[0]}}

//# call-api state.get_with_proof_by_root_raw ["{{$.call[0]}}","{{$.call-api[1].header.state_root}}"]


//# run --signers alice --args {{$.call-api[2]}}
script{
    use StarcoinFramework::DAOSpace;
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;
    // alice vote
    fun cast_vote(sender: signer, snpashot_raw_proofs: vector<u8>){

        DAOSpace::cast_vote_entry<StarcoinDAO>(sender, 1, snpashot_raw_proofs, 1);
    }
}
// check: EXECUTED


//# block --author=0x3 --timestamp 86640000

//# run --signers alice
script{
    use StarcoinFramework::DAOSpace;
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;
    fun state(_sender: signer){
        assert!(DAOSpace::proposal_state<StarcoinDAO>(1) == 5 , 103);
    }
}
// check: EXECUTED

//# block --author=0x3 --timestamp 86660000

//# run --signers alice
script{
    use StarcoinFramework::DAOSpace;
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;
    fun queue_proposal_action(_sender: signer){
        DAOSpace::queue_proposal_action<StarcoinDAO>(1);
        assert!(DAOSpace::proposal_state<StarcoinDAO>(1) == 6 , 103);
    }
}
// check: EXECUTED

//# block --author=0x3 --timestamp 86680000

//# run --signers alice
script{
    use StarcoinFramework::DAOSpace;
    use StarcoinFramework::StarcoinDAO::StarcoinDAO;
    use StarcoinFramework::UpgradeModulePlugin;

    fun execute_proposal(sender: signer){
        assert!(DAOSpace::proposal_state<StarcoinDAO>(1) == 7 , 103);
        UpgradeModulePlugin::execute_proposal<StarcoinDAO>(&sender, 1);
        assert!(DAOSpace::proposal_state<StarcoinDAO>(1) == 8 , 103);
    }
}
// check: EXECUTED

//# block --author=0x3 --timestamp 90000000

//# deploy {{$.package[0].file}} --signers alice
