import React from 'react'
import { Link } from 'react-router-dom'
import BGF from '../images/BGF.ico'
import Shopping from '../images/shopping.png'
import Frame from '../images/Frame.svg'
import { NavLink } from 'react-router-dom'

function MyNavbar(props) {
    const { auth } = props

    return (
        <>
            <nav className="sticky top-0 z-50 text-white bg-gray-800">
      <div className="max-w-full px-12 mx-auto">
        <div className="flex items-center justify-between p-4">
          <div className="flex items-center md:hidden">
            <button className="mobile-menu-button">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-6 h-6"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  stroke-width="2"
                  d="M4 6h16M4 12h16M4 18h16"
                />
              </svg>
            </button>
          </div>
          <div className="flex">
            <img className="w-20" src={BGF} alt="" />
            <div className="ml-12">
              <img
                alt="logo-font"
                className="hidden h-6 xl:block lg:block"
                src={Frame}
              />
              <div className="hidden xl:block lg:block md:block">
                <ul className="flex my-4">
                  <li className="w-36">
                    <Link to="/"
                      className="block text-center rounded-md hover:text-yellow-300"
                      >首頁</Link>
                  </li>
                  <li className="w-36">
                    <Link to="/forum" className="block text-center hover:text-yellow-300"
                      >討論區</Link>
                  </li>
                  <li className="w-36">
                    <Link to="/product"
                      className="block text-center hover:text-yellow-300"
                      >線上商城</Link>
                  </li>
                  <li className="w-36">
                    <Link to="#/" className="block text-center hover:text-yellow-300"
                      >會員中心</Link>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div>
            <Link to="order.html"
              ><img
                src={Shopping}
                alt=""
                className="flex w-5 h-5 align-middle"
            /></Link>
          </div>
        </div>
      </div>
      <div className="ml-8 mobile-menu md:hidden">
        <Link to="/home.html" className="block px-4 py-2 hover:text-yellow-300"
          >首頁</Link>
        <Link to="gameroom.html" className="block px-4 py-2 hover:text-yellow-300"
          >遊戲租賃</Link>
        <Link to="/product.html" className="block px-4 py-2 hover:text-yellow-300"
          >線上商城</Link>
        <Link to="member.html" className="block px-4 py-2 hover:text-yellow-300"
          >會員中心</Link>
      </div>
    </nav>
        </>
    )
}


export default MyNavbar

