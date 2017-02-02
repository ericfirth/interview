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
    props[:instructions] = "Wow, the last tournament for JumpKick Games was huge! So many trophies were collected... Okay, well JumpKick want their scoreboard to have some extra features. Basically it looks like the ScoreRow object is going to need to be overhauled. It used to be super-simple, just show the names, now there is tons of meta-data! UGH!!! Take a look at what the backend people gave you, can you think of how we'd fix? (This is a lot. I'd rather hear what you think you'd do before you get started)"
    props[:extra_tasks] << "Break out one of more of the pieces of this component into subcomponents"
    props[:component_props] = {
      score: {
        player: {
          name: "George Washington",
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
          profile: "http://georgewashington.com"
        },
        score: {
          points: rand(400_000...1_000_000),
          tournament_eligible: true,
        },
        game: {
          publisher: "JumpKick Games",
          title: "Punch Kick Kill",
          release: "Aug-13-2013",
        }
      },
      columns: ["player", "score", "game"]
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
