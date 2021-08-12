import * as React from 'react';

const App = () => {
    const [greeting, setGreeting] = React.useState("");
    const inputRef = React.useRef();

    const handleSubmit = (e) => {
        e.preventDefault();
        const name = inputRef.current.value.toString();

        // Interact with hello actor, calling the greet method
        const greeting = await hello.greet(name);
        return false;
    }

    return (
        <main>
            <img src="logo.png" alt="DFINITY logo" />
            <form onSubmit={handleSubmit}>
                <label for="name">Enter your name: &nbsp;</label>
                <input id="name" alt="Name" type="text" ref={inputRef} />
                <button id="clickMeBtn" type="submit">Click Me!</button>
            </form>
            <section id="greeting">{greeting}</section>
        </main>
    )
}

export default App;