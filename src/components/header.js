import { Link } from "gatsby"
import PropTypes from "prop-types"
import React from "react"

import tw from "twin.macro"

const Header = ({ siteTitle }) => (
  <header tw="bg-blue-500 overflow-hidden shadow-2xl rounded-b-lg text-white text-center py-8 ">
    <h1 style={{ margin: 0 }}>
      <Link
        to="/"
        style={{
          color: `white`,
          textDecoration: `none`,
        }}
      >
        {siteTitle}
      </Link>
    </h1>
  </header>
)

Header.propTypes = {
  siteTitle: PropTypes.string,
}

Header.defaultProps = {
  siteTitle: ``,
}

export default Header
