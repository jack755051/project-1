import React from 'react'

function MyMainContent(props) {
    return (
        <>
        <main>
            <div class="container w-screen mx-auto text-white">
                {props.children}
            </div>
        </main>
        </>
    )
}


export default MyMainContent

