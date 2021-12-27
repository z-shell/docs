// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
  title: '❮ ZI ❯',
  tagline: 'A Swiss Army Knife for Zsh - Unix shell.',
  url: 'https://z-shell.pages.dev/',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'z-shell',
  projectName: 'zi',

  presets: [
    [
      'classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/z-shell/docs/tree/main/public/',
        },
        blog: {
          showReadingTime: true,
          editUrl:
            'https://github.com/z-shell/docs/tree/main/public/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: '❮ ZI ❯',
        logo: {
          alt: 'ZI Logo',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'intro',
            position: 'left',
            label: 'Wiki',
          }
//          {to: '/blog', label: 'Blog', position: 'left'},
//          {
//            href: 'https://github.com/z-shell/zi',
//            label: 'GitHub',
//            position: 'right',
//          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Knowledge base:',
            items: [
              {
                label: 'ZI Wiki',
                to: '/docs/intro',
              },
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Github Discussions',
                href: 'https://github.com/z-shell/zi/discussions',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'Blog',
                to: '/blog',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/z-shell/zi',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Z-Shell ZI, Community.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
	plugins: [
    [
      '@docusaurus/plugin-sitemap',
      {
        changefreq: 'weekly',
        priority: 0.5,
      },
    ],
  ],
};

module.exports = config;
