import React from 'react'

function CreateGameRoomPopup(props) {
    return (props.trigger)?(
        <div className="z-50 fixed top-0 left-0 flex items-center justify-center w-full max-h-screen bg-gray-600 bg-opacity-25 box-border">
            <div className="relative w-full max-w-md p-8 bg-white shadow-lg sm:rounded-2xl top-2">
                <button 
                className="absolute text-black top-4 right-4"
                onClick={()=>props.setTrigger(false)}>close
                </button>
                {props.children}
            </div>
        </div>
    ):"";
}

export default CreateGameRoomPopup
