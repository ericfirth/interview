class ScoreboardProps
  PLAYERS = %w(Meryl\ Streep Bib\ Fortuna Deepak\ Chopra k3wl\ doood)
  GAMES = %w(PuzzleMania Shoot\ To\ Kill Simulate\ War)
  
  def initialize
  end
  
  def props
    { phases: [phase_one, phase_two, phase_three] }
  end
  
  def phase_one
    props = empty_prop_object
    props[:instructions] = "You are a new employee of a brand new website for gamers. Your goal is to make a scoreboard table. Take the props, and this table skeleton and build us scoreboard. BTW we offshored the API that you will receive them from to a developer off-shore. Good Luck!"
    props[:extra_tasks] << "sort the scores so they go high - low"
    props[:extra_tasks] << "make the player names a link that filter the list to show only that players scores"
    props[:extra_tasks] << "make a link to show all the scores and have a header above the table that shows what the table is"
    props[:component_props][:scores] = make_phase_one_scores
    
    props
  end
  
  def phase_two
    props = empty_prop_object    
    props[:instructions] = "Your company is taking off and now there are lots and lots of scoreboards, each for its own game company, that need to go everywhere. More problems with the API, though. You have no idea now what the scores object will look like, as each game company wants to highlight different things. You need to abstract that table! You did get the backend developers to agree to give you an array of what the elements are in order for any given table, though."
    props[:extra_tasks] << "none yet"
    props[:component_props] = phase_two_component_props
    
    props
  end
  
  def phase_three
    props = empty_prop_object
    
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
    
    props[:scores] = scores
    
    props
  end
  
end
