module StarcoinFramework::GenesisSignerCapability {
    use StarcoinFramework::Account;
    use StarcoinFramework::CoreAddresses;
    use StarcoinFramework::Errors;

    friend StarcoinFramework::NFT;
    friend StarcoinFramework::Oracle;
    friend StarcoinFramework::Genesis;
    friend StarcoinFramework::StdlibUpgradeScripts;
    friend StarcoinFramework::DAORegistry;
    friend StarcoinFramework::DAOExtensionPoint;
    friend StarcoinFramework::DAOPluginMarketplace;
    friend StarcoinFramework::Block;
    friend StarcoinFramework::DAOAccount;

    friend StarcoinFramework::AnyMemberPlugin;
    friend StarcoinFramework::ConfigProposalPlugin;
    friend StarcoinFramework::GrantProposalPlugin;
    friend StarcoinFramework::InstallPluginProposalPlugin;
    friend StarcoinFramework::MemberProposalPlugin;
    friend StarcoinFramework::MintProposalPlugin;
    friend StarcoinFramework::StakeToSBTPlugin;
    friend StarcoinFramework::UpgradeModulePlugin;

    const ENOT_GENESIS_ACCOUNT: u64 = 11;

    struct GenesisSignerCapability has key {
        cap: Account::SignerCapability,
    }

    public(friend) fun initialize(signer: &signer, cap: Account::SignerCapability) {
        CoreAddresses::assert_genesis_address(signer);
        assert!(
            Account::signer_address(&cap) == CoreAddresses::GENESIS_ADDRESS(), 
            Errors::invalid_argument(ENOT_GENESIS_ACCOUNT)
        );
        move_to(signer, GenesisSignerCapability{cap});
    }

    public(friend) fun get_genesis_signer(): signer acquires GenesisSignerCapability {
        let cap = borrow_global<GenesisSignerCapability>(CoreAddresses::GENESIS_ADDRESS());
        Account::create_signer_with_cap(&cap.cap)
    }
}