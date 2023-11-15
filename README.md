<!DOCTYPE html>
<html>
<body>
  <h1>Lyph:</a></h1>
    <p>This repository is a save of all the aliases and functions I like to have on my linux. From git function to cpp or hpp generator, this file help me a lot when I need to setup a new machine.</p>
    <p>The program should work on zsh and bash, don't hesitate to make an issue if you need more.</p>
    <p>The code was updated with many profile (my friends and mine), and the ability to make a new profile for the github credentials.</p>
    <p>Each profile except mine is a git submodule, I need to find a way to make it so they can change their profile without having rights on this project. I'm having trouble finding a way for them to pull request on a command line...</p>
  <h2>Installation</h2>
  <p>Follow theses step to install the project properly</p>
  <ol>
    <li>
      <strong>Clone the repository: </strong>
        <code>git clone --recursive https://github.com/Lyfmeno/Lyph.git </code>
    </li>
    <li>
      <strong>Setup and chose profile: </strong>
        <code>./SETUP.sh</code>
    </li>
    <li>
      <strong>Update terminal: </strong>
        <code>source ~/.bashrc</code> or <code>rsource</code>
    </li>
    <li>
      <strong>Retrieve and update submodules: </strong>
        <code>git submodule update --init --recursive</code>
    </li>
  </ol>
  <h2>Function and Aliases description</h2>
  <p>I will not describe everyting but here are the important or complicated one</p>
    <h3>Aliases:</h3>
        <ul>
            <li><code>lyph</code> -> List all function/Show function requested</li>
            <li><code>lypha</code> -> Show alias from argument</li>
            <li><code>rt</code> -> Clear terminal</li>
            <li><code>pyt</code> -> Clear and execute python program</li>
            <li><code>dilf</code> -> Show difference between two folders</li>
            <li><code>cpl</code> -> Compile gcc with WWW flags</li>
            <li><code>gits</code> -> Show status of current git repository</li>
            <li><code>mcl</code> -> Clear and make fclean</li>
            <li><code>mre</code> -> Clear and make re</li>
        </ul>

</body>
</html>

