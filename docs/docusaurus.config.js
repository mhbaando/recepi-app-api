/**
 * Copyright (c) Meta Platforms, Inc. and affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *
 * @format
 */
// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: 'VRLS Documentation',
  tagline: 'VRLS Documentation for users',
  favicon: 'img/favicon.ico',


  url: 'http://10.0.20.87/',
  baseUrl: '/',
  organizationName: 'mot',
  projectName: 'VRLS',

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          routeBasePath: '/'
        },
        blog: false,
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      image: 'img/logo.png',
      navbar: {
        title: 'VRLS Documentation',
        logo: {
          alt: 'VRLS Logo',
          src: 'img/logo.png',
          width: '120',
          height: '500'
        },
        items: [


        ],
      },
      footer: {
        style: 'light',
        logo: {
          alt: 'VRLS Documentation',
          src: '/img/logo.png',
          href: '#',
        },
        // Please do not remove the credits, help to publicize Docusaurus :)
        copyright: `Copyright © ${new Date().getFullYear()} Ministry of Transport & Civil Aviation Built with Docusaurus.`,
      },
    }),
};

module.exports = config;
