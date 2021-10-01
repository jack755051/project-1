import react from 'react'

import Loader from 'react-loader-spinner'

import React from 'react'

function Spinner(props) {
    return (
        <>
            <div className="spinner">
                <Loader 
                type="Puff"
                color="#00BFFF"
                height={100}
                width={100}
                timeout={3000}
                ></Loader>
            </div>
        </>
    )
}

export default Spinner
