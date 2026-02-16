
import React from 'react'
import { Route, Switch } from 'wouter';
import { PlaygroundPage } from './pages/PlaygroundPage';

//import * as releaseModule from "../public/webassembly/release";



export const App: React.FC = () => {
    return (
        <>
            <Router />
        </>
    );
}


const Router: React.FC = () => {
    return (
        <Switch>
            <Route path={"/"} component={PlaygroundPage} />
        </Switch>
    );
}
