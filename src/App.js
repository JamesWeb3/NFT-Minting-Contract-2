import { useState } from 'react';
import "./App.css";
import MainMint from './MainMint';
import NavBar from './NavBar';

function App() {
  const [accounts, setAccounts] = useState ([]); //useState is a kind of hook. Any updates in the UI like a button click you use useState

return (<div) clasName='App'>
    <NavBar accounts={accounts} setAccounts={setAccounts} />
    <MainMint accounts={accounts} setAccounts={setAccounts} />
</div>
}

export default App;