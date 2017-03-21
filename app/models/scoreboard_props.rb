class ScoreboardProps
  PLAYERS = %w(Meryl\ Streep Bib\ Fortuna Deepak\ Chopra k3wl\ doood)
  GAMES = %w(PuzzleMania Shoot\ To\ Kill Simulate\ War)

  def initialize
  end

  def props_with_page(page)
    { phases: [phase_one, phase_two, phase_three], page: page }
  end

  def phase_one
    props = empty_prop_object
    props[:instructions] = "You are a new employee of a brand new website for gamers. Your goal is to make a scoreboard table. Take the props, and this table skeleton and build us a scoreboard! BTW we offshored the API that you will receive your props from to a developer off-shore. Good Luck!"
    props[:extra_tasks] << "sort the scores so they go high - low"
    props[:extra_tasks] << "make the player names a link that filter the list to show only that players scores"
    props[:extra_tasks] << "make a link to show all the scores and have a header above the table that shows what the table is"
    props[:component_props][:scores] = make_phase_one_scores

    props
  end

  def phase_two
    props = empty_prop_object    
    props[:instructions] = "Your company is taking off and now there are lots and lots of scoreboards, each for its own game company, that need to go everywhere. More problems with the API, though. You have no idea now what the scores object will look like, as each game company wants to highlight different things. You need to abstract that table! You did get the backend developers to agree to give you an array of what the elements are in order for any given table, though."
    props[:extra_tasks] << "Have a total score for the visible scores in the header."
    props[:component_props] = phase_two_component_props

    props
  end

  def phase_three
    props = empty_prop_object
    props[:instructions] = "You've been promoted to lead developer of the scoreboards team. A couple of the top gaming companies came up with a contest to run. LEGENDS OF GAMEZ. In it, they want to take the top scorers of those game companies' games and make a scoreboard. The API team was told to pull as much info as they could on the average player. The idea is they'd showcase a player, their scores and their favorite games with lots of bells and whistles to make the scoreboard seem special and cool. The product manager is very unhappy with all the designs he got because they didn't match the data the API team found. He wants you to take a look at an average player and tell him how you think they should display the information."
    props[:extra_tasks] << "Code?"
    points = [].tap { |a| 100.times { a << rand(500_000...20_000_000) }}
    props[:component_props] = {
      player: {
        name: "George Washington",
        profile: "http://georgewashington.com",
        flair: [ 'U+1F525', 'U+1F680' ]
      },
      scores: {
        points: points,
        tournament_eligible: true,
        trophies: [
          {
            for: "Killing The Most",
            color: "silver"
          },
          {
            for: "Having Fun",
            color: "gold"
          }
        ],
      },
      games: [
        {
          publisher: "JumpKick Games",
          title: "Punch Kick Kill",
          release: "Aug-13-2013",
          art: "http://comicsalliance.com/files/2012/01/vgtwocrudedudes.jpg"
        },
        {
          publisher: "Kilgore Gaming",
          title: "Judo Chop",
          release: "Sep-03-2016",
          art: "https://s-media-cache-ak0.pinimg.com/736x/5e/d7/2c/5ed72c6de5bfcdff95a3e5de096e6415.jpg"
        },
      ],
    }

    props
  end

  private
  def empty_prop_object
    { instructions: "", extra_tasks: [], component_props: {} }
  end

  def make_phase_one_scores
    scores = []
    50.times do 
      scores << { 
        Player: PLAYERS.sample,
        gamez: GAMES.sample,
        skore: rand(10_000...1_000_000)
      }
    end

    scores
  end

  def phase_two_component_props
    props = {}
    props[:columsn] = ["player_name", "game", "headshots", "power_ups_collected", "tournament", "score"]
    props[:gm_company] = "Funimated Games, Inc."
    scores = []

    50.times do 
      scores << { falcon_hunter: [true, false].sample, player_name: PLAYERS.sample, headshots: rand(500...20_000), score: rand(10_000...1_000_000), power_ups_collected: rand(400...1000), tournament: [true, false].sample }
    end

    scores[20][:score] = "53029"
    scores[42][:score] = "30,000,000!!!!"

    props[:scores] = scores

    props
  end

end
