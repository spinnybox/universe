use leptos::*;

#[component]
pub fn Logo(cx: Scope) -> impl IntoView {
  view! {
    cx,
    <div class="w-16 h-16">
      <svg width="252" height="253" viewBox="0 0 252 253" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M62.2159 2.07956L200.333 2.83537L218.768 10.8043L228.807 14.1397L235.84 24.0803L246.651 36.732L247.768 56.3996L248.442 195.946L244.992 209.321L241.048 222.383L236.617 231.03L229.957 237.335L214.71 245.846L195.059 250.907L57.2538 249.822L41.431 249.428L29.9131 243.464L23.3901 236.628L14.7804 228.627L6.00634 214.874L1.60291 196.899L3.32813 65.6994L4.429 44.323L11.4285 27.0379L20.0382 15.8157L36.0582 5.02066L48.9563 2.32602L65.4364 2.24387" fill="url(#paint0_linear_136_413)"/>
        <path d="M111.409 51.3909L242.346 50.7172L244.909 52.7546L245.879 55.0056L245.928 72.488L245.205 74.6733L241.853 75.9056L111.541 76.0699L108.928 75.0512L107.515 72.8987L105.823 57.4045L107.992 53.1818L111.409 50.2243" fill="#D81159"/>
        <path d="M9.13328 122.571L104.629 122.078L106.978 121.766L109.41 125.101L110.527 142.354L109.443 143.849L108.309 144.687L104.152 146.461L7.78596 146.067L6.12646 144.523L5.04203 142.847L3.03748 128.273L5.38707 122.472H9.21544" fill="#FFBC42"/>
        <path d="M153.284 208.419L243.719 207.894L245.937 207.549L245.161 214.025L242.368 221.336L238.999 227.58L235.795 231.03L233.413 233.495L152.003 234.068L150.425 232.392L149.39 230.568L147.484 214.647L149.702 208.321H153.317" fill="#8F2D56"/>
        <path d="M239.402 51.318C243.297 50.6772 245.383 52.501 245.153 58.334M238.844 51.3673C243.51 51.7945 245.12 54.0784 244.726 57.6932M244.989 70.8378C245.268 74.8469 242.475 77.903 240.076 78.2645M245.055 70.9035C244.71 75.5041 243.559 76.9829 239.501 76.3913M112.163 77.3443C108.745 76.7857 106.642 75.159 106.954 71.0021M111.768 78.2645C107.71 77.5908 107.529 75.1919 107.332 71.5936M106.576 57.8246C105.82 52.9775 107.776 52.2546 112.015 50.2993M106.149 58.8762C106.05 54.0948 108.104 51.6959 112.13 51.5809M111.818 51.6138C143.43 50.3979 175.01 50.0529 239.008 50.5129L111.818 51.6138ZM112.113 50.973C158.169 50.7265 203.961 51.0223 239.419 51.3016L112.113 50.973ZM244.841 58.7119C245.58 60.7328 245.367 65.3335 245.137 69.819L244.841 58.7119ZM245.153 58.2847C245.153 62.0966 245.087 67.0258 244.71 71.0514L245.153 58.2847ZM239.567 78.1001C196.995 77.8865 155.408 78.5109 112.721 78.0508L239.567 78.1001ZM239.682 77.4593C206.623 76.4899 173.745 77.0814 112.261 76.9664L239.682 77.4593ZM106.281 70.3777C105.952 65.0213 107.135 61.8008 105.82 57.5288L106.281 70.3777ZM106.741 71.1335C106.133 66.1386 106.921 60.4042 106.987 58.334L106.741 71.1335Z" stroke="black" stroke-width="2" stroke-miterlimit="8"/>
        <path d="M103.696 122.872C106.834 122.083 109.431 124.794 109.283 129.888M103.943 123.529C106.785 122.625 109.611 125.862 108.888 129.838M109.858 141.208C109.71 144.478 108.79 148.224 103.762 146.483M110.745 141.208C109.135 145.447 106.917 146.532 104.534 147.879M9.9752 147.321C6.78763 146.384 3.73152 146.023 3.38647 140.863M9.94234 147.764C5.58819 147.156 2.81139 144.642 2.74567 140.6M3.81367 128.984C2.87711 125.763 6.21256 123.365 9.05508 122.757M3.87939 129.789C4.56948 125.369 4.71736 122.74 10.9282 123.512M9.548 123.332C37.1681 124.367 63.178 122.872 104.583 123.233L9.548 123.332ZM9.64658 123.052C43.4446 122.214 77.3741 121.968 103.959 122.707L9.64658 123.052ZM109.628 129.115C108.954 132.631 109.529 134.077 110.071 141.438L109.628 129.115ZM109.578 128.787C110.022 131.383 109.825 134.685 109.874 141.57L109.578 128.787ZM102.924 147.386C71.6727 147.583 41.1608 147.288 10.1231 147.403L102.924 147.386ZM104.041 147.337C70.9333 147.353 37.6446 148.29 9.58086 147.074L104.041 147.337ZM4.60235 141.373C4.40518 137.446 3.86296 132.878 3.66579 129.756L4.60235 141.373ZM4.12585 141.011C3.84653 136.723 4.12585 132.007 4.2573 128.59L4.12585 141.011Z" stroke="black" stroke-width="2" stroke-miterlimit="8"/>
        <path d="M154.651 234.409C149.13 235.231 148.983 231.616 147.06 227.114M154.454 234.557C151.513 235.231 149.032 231.353 148.046 228.642M148.013 214.643C147.126 209.401 149.311 208.169 155.045 207.561M147.767 213.756C147.832 210.223 151.447 208.777 154.733 208.662M155.374 208.876C185.574 208.284 221.287 207.824 246.968 208.908L155.374 208.876ZM155.193 207.939C172.659 208.646 194.62 209.056 245.933 207.709L155.193 207.939ZM234.005 233.472C213.515 234.097 199.162 234.77 155.571 233.686L234.005 233.472ZM233.659 234.885C206.22 233.587 185.475 234.212 154.207 234.968L233.659 234.885ZM147.323 227.097C148.572 225.684 147.438 222.825 148.769 215.07L147.323 227.097ZM147.915 227.508C147.8 224.337 147.832 221.922 147.734 214.889L147.915 227.508Z" stroke="black" stroke-width="2" stroke-miterlimit="8"/>
        <path d="M186.897 2.95526C228.155 2.38018 250.402 25.2846 248.776 64.1598M186.322 4.51618C226.956 4.94338 248.414 24.2495 246.935 64.4555M248.595 188.031C249.219 228.122 229.453 249.647 185.123 249.909M247.149 187.62C249.285 229.059 226.643 250.731 184.614 251.815M63.519 249.712C22.2942 250.682 1.55865 227.186 3.76037 186.47M61.8759 250.139C24.4138 251.552 2.85667 229.157 3.38246 187.456M1.83797 64.6363C-0.0351369 22.2778 21.0127 3.46461 63.7983 1M2.67594 65.6386C2.26517 25.1039 21.9821 4.91052 64.9649 2.88954M65.2606 1.03286C90.7447 2.56092 114.947 2.67594 187.85 1.44363L65.2606 1.03286ZM63.2561 2.82381C94.721 2.05157 124.576 3.3496 186.076 3.31674L63.2561 2.82381ZM248.496 63.6833C247.215 110.182 249.186 157.322 250.172 186.257L248.496 63.6833ZM249.564 65.4743C247.839 109.837 247.133 155.893 248.365 187.111L249.564 65.4743ZM185.944 249.581C152.952 249.416 117.412 249.959 63.0754 250.698L185.944 249.581ZM186.996 250.074C158.012 249.794 128.322 249.4 63.9133 249.844L186.996 250.074ZM3.44818 189.559C1.44363 155.088 2.29803 122.785 3.41532 65.8357L3.44818 189.559ZM1.60794 188.688C1.55865 144.424 1.67366 102.723 1 63.9298L1.60794 188.688Z" stroke="black" stroke-width="2"/>
        <path d="M114.443 42.8847C111.502 44.1432 102.254 46.0238 99.5815 46.4481M117.073 40C113.722 40.8343 100.034 43.0261 96.8806 44.3694L117.073 40Z" stroke="black" stroke-width="2"/>
        <path d="M189.247 68.1409C187.012 65.539 174.71 53.5762 171.599 51.3279M187.239 64.6199C184.255 62.414 170.539 55.1599 167.923 53.2934L187.239 64.6199Z" stroke="black" stroke-width="2"/>
        <path d="M150.205 203.34L69.0527 183.247C58.2352 180.574 51.6458 169.644 54.3183 158.826L71.8242 88.1238C74.4968 77.3063 85.4274 70.7169 96.2448 73.3894L177.397 93.483C188.214 96.1556 194.804 107.086 192.131 117.904L174.64 188.535C171.967 199.367 161.008 206.013 150.205 203.34Z" fill="white"/>
        <path d="M132.006 99.3796L132.84 99.3937C132.487 99.2382 132.176 99.2241 132.006 99.3796Z" fill="#BACEE5"/>
        <path d="M151.336 109.617L149.668 108.825C149.809 109.052 149.95 109.221 150.106 109.377C150.643 109.773 151.209 110.098 151.76 110.494C152.524 110.551 151.958 109.193 151.336 109.617Z" fill="#BACEE5"/>
        <path d="M197.066 113.746L201.605 101.911L196.685 91.7155L190.434 83.0474L175.969 79.5971L103.753 60.1964L106.525 60.366L94.6611 57.241L84.7345 60.0408L72.1495 66.8565L69.0951 73.7288L64.457 84.7018L48.351 148.504L51.8437 157.454L51.8013 165.133L54.6011 170.888C54.4456 166.108 54.7567 161.442 55.7182 157.059C57.203 150.045 60.3704 142.946 64.3722 136.371C65.1216 134.377 65.9135 132.454 66.8044 130.687C71.9798 120.421 79.3328 114.029 89.2594 108.09C90.0089 107.638 90.829 107.199 91.7199 106.704C96.1034 103.494 100.6 100.893 104.941 99.3937C108.165 98.2625 111.743 97.81 115.49 97.711C119.987 96.3818 123.946 95.4485 126.435 94.9678C132.6 93.8648 132.911 97.5413 133.349 99.1816L135.004 99.2099C144.704 100.2 152.92 105.828 159.891 114.482C162.648 117.861 165.519 122.287 168.163 127.18C169.04 128.551 169.86 129.909 170.624 131.252C172.674 135.155 174.215 139.51 175.262 144.134C175.94 146.552 176.464 148.857 176.803 151.12C177.581 156.762 177.397 162.686 176.464 168.541C175.304 177.873 171.755 188.606 167.4 197.91L173.834 192.905L183.039 179.019L197.066 113.746Z" fill="#BFBFBF"/>
        <path d="M174.866 77.0235C195.483 83.5988 202.397 95.0668 197.462 115.768M172.278 78.6921C197.943 80.9404 201.577 97.103 200.05 114.425M182.855 177.633C177.963 196.878 164.048 207.215 145.85 200.215M184.495 176.954C178.868 198.646 164.473 205.278 145.708 203.072M73.8039 183.473C53.8375 178.142 45.7209 164.793 52.6215 145.209M73.6908 185.75C54.1204 179.556 45.4522 165.359 48.648 142.352M65.8569 82.9342C73.1676 63.0103 86.5586 53.6918 102.933 60.1115M66.7478 85.0836C71.598 62.1053 84.1688 56.435 105.054 59.8711M104.376 61.8225C133.123 64.0709 158.123 70.83 175.446 77.3063L104.376 61.8225ZM105.139 60.2812C128.641 66.6161 154.009 73.4743 175.827 76.7549L105.139 60.2812ZM199.838 115.528C193.22 135.24 189.784 150.427 184.241 179.061L199.838 115.528ZM197.915 116.009C195.681 131.747 190.364 144.983 181.682 177.972L197.915 116.009ZM142.413 202.959C117.823 195.846 92.4269 190.388 74.525 182.695L142.413 202.959ZM143.997 201.488C123.96 195.379 106.935 190.84 72.6726 183.19L143.997 201.488ZM51.0943 145.972C55.5344 121.043 63.5662 98.9695 66.8751 80.6859L51.0943 145.972ZM50.3731 145.478C56.2131 125.766 60.5825 104.202 65.0085 83.2453L50.3731 145.478Z" stroke="black" stroke-width="2"/>
        <path d="M143.279 142.429C147.873 142.64 152.703 146.808 155.082 149.684C157.472 152.57 158.073 155.454 157.409 159.842C156.744 164.229 154.424 171.648 151.061 176.186C147.698 180.724 142.235 184.659 137.431 187.162C132.628 189.664 126.957 191.037 122.17 191.197C117.383 191.356 111.633 190.838 108.746 188.113C105.849 185.379 104.485 179.406 104.662 174.766C104.839 170.126 106.569 164.234 109.852 159.995C113.134 155.756 118.762 152.156 124.047 149.354C129.333 146.552 138.082 144.207 141.471 143.233C144.916 142.214 143.594 142.96 144.645 143.417C145.696 143.874 147.725 145.771 147.726 146.082L143.279 142.429ZM119.854 153.122C124.168 149.654 129.42 147.518 134.515 146.112C139.609 144.706 146.759 143.556 150.585 144.73C154.411 145.903 156.317 149.068 157.348 153.034C158.379 157.001 158.397 163.682 156.686 168.456C154.975 173.23 151.325 177.918 146.944 181.825C142.564 185.732 135.603 190.471 130.299 191.888C125.02 193.362 118.979 192.04 115.163 190.473C111.291 188.933 108.741 186.265 107.191 182.531C105.64 178.798 104.426 172.71 105.931 168.388C107.437 164.066 114.246 158.82 116.151 156.378C118.021 153.889 116.731 154.551 117.074 153.662C117.428 152.783 117.548 150.982 118.24 151.164" fill="#681717"/>
        <path d="M144.397 144.457C149.544 144.573 154.893 146.005 157.365 148.902C159.811 151.742 160.239 157.407 159.241 161.577C158.243 165.747 155.236 169.627 151.479 173.843C147.722 178.059 141.538 183.925 136.543 186.819C131.547 189.712 126.07 191.006 121.641 191.129C117.22 191.241 112.943 189.48 109.968 187.267C107.049 185.028 103.76 182.192 103.904 177.726C104.058 173.249 107.325 165.052 110.653 160.467C113.981 155.882 118.837 152.712 123.927 150.06C129.017 147.408 138.044 145.637 141.088 144.528C144.095 143.442 141.707 143.682 142.065 143.646C142.388 143.563 142.945 144 143.013 144.184M142.826 144.323C147.318 144.616 152.07 147.113 154.401 149.803C156.731 152.493 157.44 155.849 156.801 160.295C156.162 164.74 153.63 172.149 150.393 176.444C147.157 180.738 142.841 183.493 137.671 186.042C132.465 188.545 124.363 191.418 119.378 191.417C114.394 191.415 110.238 188.858 107.86 185.891C105.482 182.924 104.709 177.836 105.119 173.715C105.53 169.594 107.047 165.191 110.386 161.218C113.624 157.235 119.699 152.685 124.787 149.813C129.901 146.998 137.08 144.739 141.026 144.112C144.982 143.473 146.538 145.659 148.549 146.17C150.513 146.717 153.181 147.363 152.951 147.376L142.826 144.323Z" stroke="black" stroke-width="2"/>
        <path d="M104.444 152.715C109.068 152.77 114.488 154.393 118.755 156.55C123.022 158.707 127.767 161.946 130.186 165.674C132.66 169.487 134.606 175.526 133.448 179.214C132.289 182.902 127.271 185.57 123.238 187.659C119.204 189.748 114.451 191.713 109.375 191.666C104.299 191.618 97.2478 190.267 92.891 187.515C88.5341 184.762 85.0284 179.011 83.3771 175.026C81.7818 171.071 81.8406 167.154 83.2226 163.653C84.6045 160.153 85.2891 155.058 91.6411 153.965C97.979 152.872 114.382 153.911 121.111 156.967C127.839 160.024 132.109 172.293 132.191 172.506L104.444 152.715ZM93.2885 153.509C97.4236 151.252 103.069 150.106 107.921 150.999C112.829 151.907 118.34 155.936 122.637 158.928C126.918 161.99 131.907 165.035 133.528 169.132C135.093 173.214 134.244 179.877 132.196 183.452C130.148 187.028 125.871 189.382 121.228 190.599C116.585 191.816 109.305 191.636 104.214 190.683C99.1227 189.73 94.2527 188.186 90.7788 185.022C87.3049 181.859 84.1591 175.688 83.413 171.689C82.5965 167.674 84.5664 163.631 86.0082 160.853C87.4348 158.145 90.8852 156.273 92.0453 155.301C93.262 154.329 92.9697 154.961 93.1678 154.95" fill="#681717"/>
        <path d="M101.272 152.059C105.997 151.946 114.914 155.262 120.068 157.659C125.222 160.056 129.832 162.868 132.154 166.509C134.475 170.151 135.376 176.047 133.938 179.533C132.57 183.034 127.967 185.355 123.792 187.484C119.631 189.599 113.909 192.031 108.803 192.095C103.697 192.16 97.2964 190.805 93.2242 187.93C89.1107 184.983 85.9123 178.543 84.2459 174.615C82.5794 170.701 82.1248 168.007 83.3236 164.461C84.5074 160.972 88.0951 155.609 91.4627 153.609C94.8304 151.595 101.377 152.612 103.532 152.277C105.657 151.998 104.433 151.555 104.288 151.836M119.872 154.714C124.632 156.935 129.238 161.94 131.189 165.745C133.14 169.551 132.771 173.434 131.635 177.518C130.499 181.602 128.015 187.83 124.22 190.05C120.425 192.27 114.261 191.216 108.938 190.655C103.614 190.094 96.9411 189.032 92.3521 186.672C87.7631 184.312 83.235 180.723 81.4716 176.666C79.7084 172.595 79.9324 166.15 81.7717 162.331C83.6111 158.497 87.9145 155.394 92.4083 153.736C96.9021 152.078 102.357 150.435 108.918 152.414C115.478 154.394 127.738 161.112 131.741 165.711C135.745 170.311 133.413 179.666 132.871 179.983L119.872 154.714Z" stroke="black" stroke-width="2"/>
        <path d="M132.372 152.213C135.711 153.003 138.971 157.382 141.213 160.694C143.478 163.948 145.966 167.995 145.847 171.843C145.728 175.677 143.582 180.605 140.519 183.851C137.481 187.038 131.617 190.791 127.63 191.149C123.654 191.45 119.874 188.237 116.758 185.847C113.641 183.456 109.956 180.393 109.06 176.625C108.149 172.859 109.352 166.942 111.347 163.185C113.343 159.428 116.921 155.398 121.261 154.153C125.602 152.908 133.721 154.875 137.293 155.762C140.818 156.582 142.482 159.294 142.559 159.176L132.372 152.213ZM129.455 150.49C132.829 149.647 135.71 151.231 138.457 154.256C141.193 157.337 145.341 164.479 145.881 168.879C146.422 173.279 143.952 177.138 141.598 180.38C139.243 183.622 135.118 186.865 131.736 188.474C128.355 190.082 124.837 191.345 121.305 190.199C117.774 189.054 112.407 185.18 110.725 181.534C109.042 177.874 110.129 172.574 111.153 168.271C112.178 163.967 114.179 158.127 116.976 155.593C119.716 153.049 125.809 153.263 127.77 152.909C129.732 152.569 128.688 153.076 128.627 153.448" fill="#681717"/>
        <path d="M119.076 169.174C124.255 168.838 130.875 170.406 135.47 171.553C140.065 172.7 145.421 174.223 146.771 176.247C148.12 178.256 146.894 181.198 143.687 183.532C140.49 185.808 133.344 189.007 127.645 190.071C121.947 191.135 115.09 190.277 109.556 189.729C104.023 189.181 97.3267 188.411 94.538 186.708C91.6778 184.995 91.0684 181.718 92.5719 179.339C94.0754 176.96 97.7459 174.129 103.594 172.531C109.441 170.933 122.289 170.198 127.793 169.855C133.354 169.522 136.835 170.529 136.859 170.471L119.076 169.174ZM114.115 168.929C118.756 167.735 123.657 167.927 128.909 168.932C134.161 169.938 143.164 172.641 145.694 174.729C148.226 176.832 146.194 179.373 143.966 181.502C141.8 183.711 136.929 186.181 132.586 187.809C128.242 189.437 123.569 190.803 117.924 190.929C112.325 191.122 102.791 190.296 98.8846 188.835C94.978 187.374 94.4424 184.362 94.299 181.934C94.1697 179.505 94.7259 176.068 97.7796 174.212C100.833 172.356 109.919 171.086 112.615 170.486C115.312 169.9 114.096 170.376 114.051 170.563" fill="#C90606"/>
        <path d="M123.349 172.396C129.322 172.221 135.863 172.022 139.775 173.191C143.704 174.37 146.986 177.516 146.948 179.447C146.923 181.375 143.129 182.947 139.424 184.816C135.778 186.683 130.309 189.513 124.946 190.583C119.582 191.653 112.257 192.339 107.217 191.347C102.178 190.355 96.9922 186.38 94.5398 184.564C92.1456 182.745 91.6833 182.338 92.7143 180.418C93.7453 178.497 96.3477 174.685 100.756 173.091C105.222 171.494 115.758 171.464 119.402 170.913C123.046 170.361 122.471 169.825 122.72 169.868C122.974 169.925 121.13 170.569 120.914 171.077M99.6175 173.774C103.088 172.107 108.959 169.88 114.688 169.778C120.417 169.676 129.269 172.045 134.113 172.977C138.965 173.982 142.581 173.926 143.978 175.72C145.376 177.514 144.814 181.287 142.444 183.714C140.074 186.141 134.741 189.27 129.569 190.341C124.398 191.412 116.936 190.663 111.55 190.189C106.164 189.715 100.329 188.874 97.0762 187.492C93.8239 186.109 91.9182 183.951 92.0508 181.696C92.1834 179.44 96.0994 175.38 97.8422 174.058C99.585 172.735 101.504 173.811 102.621 173.695C103.739 173.58 104.334 173.105 104.353 173.365L99.6175 173.774Z" stroke="black" stroke-width="2"/>
        <path d="M121.181 56.4753C124.985 58.964 129.114 65.101 130.599 70.7289C132.027 76.3426 131.673 83.4977 129.976 90.073C128.28 96.6483 124.278 104.567 120.432 110.294C116.585 116.007 111.919 121.394 106.8 124.42C101.681 127.446 94.3707 129.553 89.676 128.578C84.9814 127.602 81.2342 123.289 78.6606 118.665C76.087 114.041 74.6589 107.098 74.2912 100.792C73.9236 94.4849 74.3195 86.948 76.5537 80.7686C78.7879 74.5892 83.0583 68.4664 87.6115 63.5597C92.2213 58.667 98.6977 53.223 103.986 51.5827C109.275 49.9424 116.133 52.2756 119.357 53.4634C122.595 54.6512 122.821 57.8469 123.585 58.6812C124.348 59.5155 124.292 58.158 123.839 58.4267L121.181 56.4753ZM117.547 52.5018C121.817 53.3644 124.985 56.645 127.318 61.4669C129.637 66.3312 131.899 74.8437 131.518 81.5463C131.122 88.3055 128.463 95.6727 125.126 101.894C121.789 108.116 115.963 114.31 111.438 118.835C106.913 123.36 102.544 128.111 98.0331 128.917C93.4798 129.709 87.8236 126.909 84.1895 123.699C80.5413 120.546 77.4021 115.865 76.2002 109.856C74.9982 103.846 75.3942 94.7111 76.7234 87.5419C78.0384 80.4292 80.81 72.3267 84.0623 66.9816C87.3004 61.6931 91.2315 58.4974 96.2372 55.6269C101.243 52.7563 110.703 50.2959 114.153 49.801C117.603 49.3061 116.614 52.2756 116.967 52.6715C117.321 53.0816 116.571 51.9362 116.246 52.2331" fill="white"/>
        <path d="M128.704 69.5693C130.372 74.2215 129.425 80.3868 128.52 87.16C127.615 93.9333 126.385 104.072 123.288 110.11C120.191 116.148 115.242 120.871 110.081 123.572C104.905 126.329 97.3826 126.965 92.1648 126.513C86.9469 126.06 82.1675 124.42 78.9434 120.871C75.776 117.336 73.6266 111.284 73.061 105.246C72.4954 99.2077 73.358 91.077 75.5215 84.6996C77.6849 78.3223 81.5029 72.1994 85.9006 66.8826C90.2982 61.5658 96.6473 55.3016 101.794 52.6714C106.956 49.9706 112.499 49.2919 116.854 50.8897C121.209 52.4735 125.89 58.9639 127.884 62.0183C129.877 65.0726 128.421 68.3674 128.817 69.1168C129.213 69.8521 130.683 66.5008 130.415 66.5574M125.367 61.0426C128.633 64.4222 131.221 70.3188 131.574 76.6254C131.928 82.932 130.514 92.0668 127.686 98.8118C124.858 105.557 119.159 112.288 114.592 116.982C110.024 121.677 105.117 125.212 100.324 126.98C95.5302 128.747 90.0154 130.02 85.9571 127.531C81.8847 125.042 78.1233 117.703 75.9739 112.175C73.7963 106.702 72.0712 100.749 72.9055 94.5414C73.7398 88.3337 77.2607 81.0655 80.8383 74.9568C84.4017 68.8481 89.6195 62.0042 94.3707 58.1014C99.1785 54.2269 104.891 51.8513 109.529 51.5261C114.224 51.215 119.06 52.4169 122.355 56.1783C125.649 59.9396 128.28 68.226 129.354 74.2639C130.429 80.3019 128.916 92.1092 128.548 92.2789L125.367 61.0426Z" stroke="black" stroke-width="2"/>
        <path d="M158.993 66.925C158.781 66.4867 158.045 67.6462 159.106 67.2785C160.166 66.8967 161.863 64.1818 165.271 64.6342C168.75 65.115 175.862 66.1614 179.751 70.1349C183.639 74.1084 186.892 81.9705 188.645 88.362C190.441 94.8383 191.318 102.163 190.399 108.738C189.494 115.243 186.326 122.087 183.06 127.503C179.793 132.919 175.297 138.405 170.856 141.29C166.43 144.174 161.085 146.31 156.49 144.91C151.894 143.51 146.393 138.306 143.283 133.244C140.172 128.182 138.56 121.239 137.824 114.38C137.089 107.522 137.23 98.6562 138.8 92.0526C140.37 85.449 143.396 78.9585 147.27 74.6598C151.159 70.3611 157.734 66.8543 162.259 66.4442L158.993 66.925ZM168.665 65.1574C168.509 64.7332 167.321 65.3978 167.816 65.1999C168.311 65.0019 168.82 61.9193 171.648 63.9697C174.476 66.02 181.688 72.6095 184.785 77.4879C187.882 82.3664 189.875 86.9621 190.257 93.2121C190.653 99.4057 189.324 107.862 187.146 114.819C184.969 121.79 181.122 130.062 177.191 134.799C173.26 139.536 168.382 142.166 163.673 143.312C158.964 144.457 152.658 144.302 148.995 141.474C145.333 138.645 143.735 132.41 141.854 126.301C139.974 120.192 137.697 112.005 137.655 104.935C137.612 97.8644 138.644 90.0447 141.501 83.9501C144.357 77.8556 150.268 71.3086 154.581 68.1411C158.908 64.9171 163.235 63.4889 167.406 64.7757" fill="white"/>
        <path d="M149.391 70.9697C149.179 70.7859 148.854 74.4341 149.603 73.9675C150.296 73.5008 150.551 69.9092 153.746 68.1275C156.942 66.3599 164.126 62.7399 168.693 63.4328C173.289 64.055 177.87 67.3073 181.179 72.0444C184.488 76.838 187.259 85.2798 188.603 92.0248C190.003 98.784 190.54 105.967 189.465 112.628C188.391 119.288 185.365 126.867 182.056 131.958C178.747 137.048 174.01 141.375 169.57 143.044C165.115 144.698 160.067 143.892 155.245 141.87C150.423 139.848 144.117 135.775 140.766 130.911C137.485 126.061 135.293 119.613 135.364 112.84C135.435 106.066 139.083 96.5074 141.444 90.1017C143.806 83.6961 145.899 77.7995 149.49 74.4624M138.913 94.6691C138.729 94.3722 142.901 83.2153 146.606 78.3652C150.31 73.515 156.504 67.4063 161.241 65.6387C165.921 63.8429 170.757 65.0448 174.759 67.5053C178.761 69.9657 182.72 74.7311 185.096 80.3872C187.542 86.0576 188.9 94.5419 189.211 101.598C189.522 108.597 189.31 116.757 187.09 122.625C184.926 128.507 180.628 132.947 176.145 136.779C171.677 140.612 164.903 145.405 160.152 145.702C155.401 145.999 151.116 142.308 147.694 138.519C144.272 134.729 141.572 129.313 139.733 123.021C137.895 116.728 136.043 108.131 136.637 100.834C137.259 93.552 140.271 84.7991 143.523 79.3974C146.775 73.9958 151.823 69.9657 156.292 68.5093L138.913 94.6691Z" stroke="black" stroke-width="2"/>
        <path d="M119.258 70.9409C117.193 71.0116 113.998 72.7792 111.806 75.1265C109.685 77.4879 107.762 81.1079 106.432 84.8976C105.117 88.6731 104.283 93.8485 104 97.8219C103.703 101.852 103.788 105.91 104.75 109.035C105.641 112.146 107.663 115.399 109.6 116.388C111.537 117.378 114.097 116.346 116.331 114.847C118.565 113.348 121.11 110.322 123.005 107.324C124.971 104.284 126.964 100.41 128.011 96.7048C129.001 92.9718 129.241 88.6165 129.043 84.7703C128.845 80.9241 128.138 76.2719 126.752 73.8114C125.367 71.351 122.256 70.4601 120.771 70.0218C119.272 69.5834 118.254 71.1247 117.759 71.3227C117.264 71.5207 117.688 70.8561 117.745 71.1247L119.258 70.9409ZM121.718 70.0783C119.951 69.1875 117.929 69.8521 115.652 71.5207C113.375 73.1892 110.18 76.7668 108.37 80.2312C106.546 83.6956 105.372 88.2064 104.75 92.293C104.128 96.3655 104.396 101.244 104.707 104.92C105.018 108.597 105.146 112.217 106.56 114.041C107.903 115.851 110.717 116.162 112.951 115.681C115.185 115.215 117.561 113.871 119.753 111.27C121.93 108.668 124.377 104.015 125.989 100.056C127.615 96.0968 128.944 91.2325 129.326 87.6125C129.708 83.9926 129.241 81.2352 128.308 78.2515C127.375 75.2679 124.744 71.153 123.656 69.8521C122.567 68.5512 122.058 70.347 121.846 70.4319C121.633 70.5026 122.227 70.2056 122.227 70.4601" fill="black"/>
        <path d="M151.032 79.6515C148.981 79.906 145.913 81.9139 143.947 84.4451C141.996 86.9055 140.398 90.7517 139.38 94.5979C138.362 98.4442 137.909 103.662 137.937 107.706C137.966 111.75 138.362 115.823 139.549 118.821C140.737 121.818 142.971 124.929 144.951 125.735C146.931 126.541 149.405 125.368 151.555 123.657C153.633 121.988 155.967 118.778 157.649 115.611C159.332 112.443 161.085 108.441 161.778 104.638C162.471 100.834 162.4 96.4503 161.92 92.6748C161.439 88.8993 160.35 84.2754 158.752 81.8857C157.168 79.5101 154.043 78.8596 152.516 78.6051C150.989 78.294 150.141 79.9343 149.632 80.1322C149.137 80.3302 149.49 79.6515 149.617 79.9343L151.032 79.6515ZM153.421 78.5627C151.625 77.7991 149.617 78.6475 147.496 80.4999C145.432 82.3664 142.448 86.1137 140.921 89.7053C139.394 93.297 138.574 97.9068 138.263 102.008C137.994 106.179 138.602 111.001 139.196 114.55C139.776 118.156 140.228 121.79 141.727 123.515C143.24 125.17 146.096 125.297 148.232 124.675C150.381 124.053 152.686 122.511 154.651 119.726C156.617 116.94 158.724 112.076 159.982 108.031C161.241 103.987 162.217 99.0239 162.358 95.3474C162.429 91.7133 161.75 88.9842 160.605 86.1278C159.445 83.2714 156.518 79.3404 155.33 78.1526C154.142 76.9648 153.775 78.7323 153.549 78.8596C153.322 79.001 153.874 78.5627 153.944 78.8313" fill="black"/>
        <defs>
          <linearGradient id="paint0_linear_136_413" x1="124.99" y1="2.08764" x2="124.99" y2="250.893" gradientUnits="userSpaceOnUse">
            <stop offset="2.02456e-07" stop-color="#37BAE6"/>
            <stop offset="0.2071" stop-color="#4EC6EB"/>
            <stop offset="0.7416" stop-color="#86E3F6"/>
            <stop offset="1" stop-color="#9CEEFA"/>
          </linearGradient>
        </defs>
      </svg>
    </div>
  }
}