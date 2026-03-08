
import React from 'react'
import { Route, Switch } from 'wouter';

import { PlaygroundPage } from './pages/PlaygroundPage';
import { CompilerPage } from './pages/CompilerPage';


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
            <Route path={"/compiler"} component={CompilerPage} />
        </Switch>
    );
}
