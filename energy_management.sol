pragma solidity ^0.4.11 ;

contract energy_management{
    
    uint public current_available_energy = 100 ;
    uint public constant min_price = 10;
    
    mapping(address => uint) wallet ;
    
    function current_price() public pure returns(uint){
        return min_price;
    }
    
    function display_wallet(address prosumer) external constant returns(uint){
        return wallet[prosumer] ;
    }
    
    function sell_energy(address prosumer, uint amount) external returns(uint){
        uint sold_for = amount * current_price() ;
        wallet[prosumer] += sold_for ;
        current_available_energy += amount ;
        return sold_for ;
    }
    
    modifier can_buy_energy(address prosumer, uint amount){
        require(wallet[prosumer] >= current_price() * amount && current_available_energy>amount) ;
        _;
    }
    
    function buy_energy(address prosumer, uint amount) external
    can_buy_energy(prosumer, amount){
        wallet[prosumer] -= amount*current_price();
        current_available_energy -= amount ;
    }
}
