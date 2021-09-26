import React from 'react'


function SearchBar(props) {
    return (
        <>
            <form action="/" method="get">
                <input
                    className="text-black text-center rounded-md border border-transparent focus:outline-none focus:ring-2 focus:ring-indigo-700 focus:border-transparent "
                    type="text"
                    id="header-search"
                    placeholder="Search Forum posts"
                    name="s" 
                />
                <button type="submit" className="px-6 py-2 ml-4 font-semibold cursor-pointer text-center focus:outline-none transition hover:shadow-lg shadow hover:bg-indigo-700 rounded-full text-white bg-indigo-600 ">Search</button>
            </form>
        </>
    )
}

export default SearchBar

