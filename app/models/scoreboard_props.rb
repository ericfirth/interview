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
    props[:instructions] = "You are a new employee of a brand new website for gamers. Your goal is to make a scoreboard table. Take the props, and this table skeleton and build us scoreboard."
    props[:extra_tasks] << "sort the scores so they go high - low"
    props[:extra_tasks] << "make the player names a link that filter the list to show only that players scores"
    props[:extra_tasks] << "make a link to show all the scores and have a header above the table that shows what the table is"
    props[:component_props][:scores] = make_phase_one_scores
    
    props
  end
  
  def phase_two
    empty_prop_object
  end
  
  def phase_three
    empty_prop_object
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
  
end
