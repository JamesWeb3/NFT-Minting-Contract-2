import React from 'react';

const NavBar =({accounts, set Accounts}) => {
    const isConnected = Boolean(accounts[0]);//accounts 0 is going to be the address of the wallet that comes back in, we will set this to a boolean.

    async function connectAccount() { //we will set setAccounts to accounts, meaning when we call this function we are going to update the accounts in the App.js file
        if (window.ethereum){
            const accounts = await window.ethereum.request({
                method: "eth_requestAccounts";
            })
            setAccounts(accounts);
        }
    }

    return (
        <div>
            {/* Left Side - Social Media Icons */}
            <div>Facebook</div>
            <div>Twitter</div>
            <div>Facebook</div>

            {/* RIght Side - Sections and Connect */}
            <div> About </div>
            <div> Mint </div>
            <div> Team </div>

            {/* Connect */}
            {isConnected ? (
                <p>Connected</p> //if the user is connected it will show this
            ) : (
                <button onClick={connectAccount}>Connect</button> //otherwise it will show a button saying to connect. So if you are not connected it will show the button, Once you click to get account it will give us the account and then the accounts command wwill be udpated and is Connected will turn true.
            )}



        </div>
    )   
}