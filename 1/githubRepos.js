const axios = require("axios");

async function getPopularRepos(username) {
  try {
    const response = await axios.get(
      `https://api.github.com/search/repositories`,
      {
        params: {
          q: `user:${username}`,
          sort: "stars",
          order: "desc",
          per_page: 10,
        },
      }
    );

    const repos = response.data.items;

    console.log(`Top 10 popular repositories for ${username}:`);
    repos.forEach((repo, index) => {
      console.log(
        `${index + 1}. ${repo.name} - Stars: ${repo.stargazers_count}`
      );
    });
  } catch (error) {
    console.error("Error:", error.message);
  }
}

getPopularRepos("google");
