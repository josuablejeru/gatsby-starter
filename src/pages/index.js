import React from "react"
import { Link } from "gatsby"
import tw from "twin.macro"

import Layout from "../components/layout"
import Image from "../components/image"
import SEO from "../components/seo"

const IndexPage = () => (
  <Layout>
    <SEO title="Home" />
    <h1 tw="py-8 mt-8 max-w-sm rounded-lg overflow-hidden shadow-2xl text-center hover:bg-gray-300">
      Welcome to my Starter!
    </h1>
    <p>Welcome to your new Gatsby site.</p>
    <p>Now go build something great.</p>
    <div style={{ maxWidth: `300px`, marginBottom: `1.45rem` }}>
      <Image />
    </div>
    <Link to="/page-2/">Go to page 2</Link> <br />
  </Layout>
)

export default IndexPage
