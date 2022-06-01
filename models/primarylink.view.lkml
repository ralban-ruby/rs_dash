view: primarylink {
  sql_table_name: "RS"."PRIMARYLINK"
    ;;

  dimension: employee_code {
    type: number
    sql: ${TABLE}."EMPLOYEE_CODE" ;;
  }

  dimension: employeeid {
    type: number
    value_format_name: id
    sql: ${TABLE}."EMPLOYEEID" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

  dimension: supervisor_primary {
    type: string
    sql: ${TABLE}."SUPERVISOR_PRIMARY" ;;
  }

  dimension: team {
    type: string
    sql: ${TABLE}."TEAM" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  dimension: Tenure {
    type : number
    sql: ${TABLE}."TENURE";;
  }

  dimension: tenure_tier {
    group_label: "Tenure"
    label: "By Tier"
    style: integer
    type: tier
    tiers: [0,60,120,365]
    sql: ${Tenure};;
  }

  dimension: ROS_test_team {
    type :  string
    case: {
      when: {
        sql: ${TABLE}.name IN ('Chris Page','Angelica Thomas','Hailey Fuller')  ;;
        label: "Alpha"
      }
      when: {
        sql: ${TABLE}.name IN ('Amy Gray','Anthony Contreras','Cameron Esch','Charles Williams',
                                'Crystal Castro','Jenn Schaaf','Jodie Hess', 'Karrie Elkins', 'Katy Aman',
                                'Keri Stewart','Lauren Phillips','Maria Guzman','Marissa Hunt','Mellissa Dowd',
                                'Mercedes Alvarado','Neena Nuhring','Rachel Rhodus','Sharene Neidig','Zach Duling','Zach Kramberg');;
        label: "Beta"
      }
      when: {
        sql: ${TABLE}.name IN ('Jennifer Engelhart','Jessica Gonzalez','Jessica Brown', 'Kat Oconnor',
                              'Kerry Connor','Liana Walker','Mari Dujohn','Noah Pierce','Rachel Shepard','Reshah Francois','Sue Earle',
                              'Taylor Defraties','Teja Carlen','Tiarah Greenwood','Tracie Hill','Ana Espinoza-Rodriguez','Emma Mullins',
                              'Holly Nelson','Jade Jackman','Jodi Hoffman','Jordan Haney','Karla Goehring','Mary Powell','Nicci Munn','Scottie Myers',
                              'Sequaia Anderson','Sherida Price','Tra Erby','Anna Scott','Tristan Clemons','Dylan Wright','Erika Vargas',
                              'Hannah Boger','Heather Schuman','Isabella Perdomo','Joanna Barber','Kaitlin Nelms','Kourtney Wood','Maria Balleza',
                              'Morgan Osborne','Nia Chandler','Siobhan Gies','Stephanie Byrd','Susanne Yarmer','Tatiana Galaz','Jessaca Brown-Maruhn');;
        label: "Beta 2"
      }
      when: {
        sql: ${TABLE}.name IN ('Anthony Manietta','Erika Leibelt','Jessi Ip','Olivia Odell','Taylor Urfer','Allison Maschhoff','Ash Henrion',
                              'Cara Coon','CC Ceballos','Charity Bryant','Jamie Travis','Janna Kipling','Jessica Morgan','Megan Thompson',
                              'Megan Lomeli','Noemi Montero','Shay Carr','Stephanie Raasch','Traci Schafer','Addy Lindberg','Brandie Gilbert',
                              'Carrie Askinas','Corey Christiansen','Monica Swayzer','Nicole Romero','Phoenix Rambo','Shanna Walker','Tae Joseph',
                              'Tana Chandler','Tracey Brown','Malanya Cam','Mary Loudermilk');;
        label: "Rollout Group 1"
      }
      when: {
        sql: ${TABLE}.name IN ('Felicia Wilson','Lynn Young','Morgan Norman','Bill Cory','Julie Lewis','Leslie Tena-Diaz','Nicholl Kaput',
                              'Sarah Page','Shelly Gray','Stephanie Laaker','Alex Phompat','Casandra Tappin','Jackie Manning','Krystyn Easley',
                              'Lyric Montgomery','MacRista Barber-Smith','Mari Jean Arscott','Misty Harding','Natalie Albert','Shanna Henson',
                              'Adrianna Luna','Amber Meade','Ashley Thomas','Brittney Harris','Brittney Baysinger','Connie Shieh','Jocelin Woods',
                              'Lexi Palmer','Michael Brooks','Porche Grant','Sarah Courter','Sheika Derrell');;
        label: "Rollout Group 2"
      }
      when: {
        sql: ${TABLE}.name IN ('Monique Fue','Amber Morse','Beth Landau','Brianna Crowe','Heather Wyland','Jenna Morgan',
                              'Jess Espayos','Lindsay Shannon','Meghan Esch','Samantha Green','Sara Redmond','Shauntah Jones',
                              'Sherry Watson','Stephanie Jones','Troy Terwilliger','Will Slattery','Angela Keightley','Ashley Espayos',
                              'Carrie Morgan','Daniel Nelson','Hannah Rettman','Jenn Berry','Jenny Krieck','John Gross III',
                              'Justin Hankins','Kayla Ryan','Kulani Smith','Luci Ekeroma','Sydny Bacca','Carrie Sheets',
                              'Elizabeth Romane','Shannon Buck','Sierra Ermitanio-Vidad','Tristan Smith','Amanda Brendel','Angie Soria',
                              'Ashley Hanna','Cory Grimes','Danielle Jackson','Julie Leckrone',
                              'Kaycee Read','Kayla Brown','Patty Galvin','Rachel Esparza','Suzie Wilson');;
        label: "Rollout Group 3"
      }
      when: {
        sql: ${TABLE}.name IN ('Aaron Siefers','Alicia Randall','Alyx Howard','Amanda Allred','Audra Fetherolf','August Connell',
          'Barbara Montgomery','Becka Swygart','Bethany Mills','Mona Hernandez Rodriguez','Monica Vargas-Renteria',
          'Betty Moyer','Brandon Fox','Brittany Dugan','Brittany Ertel','Brooke Blair','Brooklyn Walsh',
          'Carli Rudder','Caterra Hopper','Charlotte Quintana','Cherie Smith','Delanie Helland','Denise Padilla',
          'Destiny Howell','Erika Comparoni','Francis Jones','Heather Vasas','Jalynn Krush','Jarlyn Torres',
          'Jen Gibson','Jennifer Toth','Jessica Gray','Jessica Parker','John Sorenson','Joycelyn Watterson-Woods',
          'Katherine Austin','Kathleen Stepp','Katie Rataezyk','Kay Miller','Kayla Jones','Kayla Mullins',
          'Kayleigh Lillethun','Kellie Hoops','Kim Rabon','Kristen Palmer','Lainnie Alexander','Lannan Sampson',
          'Lauren Harvey','Leslie Reed','Lisa Army','Lisa Lilja','Lori Gross','Lukas Roman',
          'Madison Sturdevant','Megan Attaway','Megan Shebosky Aken','Meredith Christian','Michelle Basa',
          'Mikki Lafollette','Nancy Figueroa Lopez','Nicole Romero','Paige Buzan','Michelle Hall',
          'Polly Lewis-Vance','Poppy Frohlich','Raquel Bradley','Raquel Vega','Roshie Kia','Ruby Moreno',
          'Sam Celesky','Samara Howell','Sarah Brentano','Scott Ward','Shaelee Chinn','Shelby Duncan',
          'Spencer McNeal','Stephanie Adams','Tati Athanasiou','Tori McCabe','Torry Bachman','Toya Edmondson');;
        label: "Rollout Group 4"
      }
      when: {
        sql: ${TABLE}.name IN
          ('Alena Kulishov','Alexa Price','Ali Bergstedt','Alondra Gamez Carrera','Angel Moffitt-Baker',
          'Ashley Short','Brandi Coffield','Brandon Bell','Brandon Hood','Bre Drummond','Caitlin Argue',
          'Caleb Lachapelle','Caty Turner','Christian Kimbrough','Dominique Shirley','Dylan Wright',
          'Emily Johnson','Gordon Hays','Hana Krahenbuhl','Heather Pitts','Jalen Vaughn',
          'Jared Evans','Jenn Webb','Jennifer Davis','Jodi Degraffenried','Jordan Hoffhines',
          'Kaitlin Jolliff','Karen Montes Amezcua','Karina Holtzman','Katie Amos','Katie Yorkis',
          'Kaycee Kelley','Kayla Cretel','Kelsey Tegen','Keyla Rodriguez-Torres','Koa Kennedy','Kristina Karst',
          'Krystyn Easley','Kyenna Leedom','Lau Sao','Lavelle Cavender','Leah Hunt','Linda Drew',
          'Lindsay Simmons','MacKenzie Martin','Matt Greenlee','Melissa Serrano','Mikayla Salgado',
          'Miranda Tesch','Missy Blem','Nancy Nguyen Vu','Nate Hoff','Nate Nuusila','Nesha Thomas',
          'Nikki Chitwood','Nina Morgan-Miller','Patrick Lapietra','Priscilla Reynolds','Rachel Shepard',
          'Rudi Gonzalez','Ryckie Seger','Sade Sanders-Adams','Sam Blome','Sandy Holm','Sarah Dollard','Sarah Inge',
          'Sara-Lee Frazey','Shannen Tobias','Sierra Shick','Sydney Westhusin','Tasha Quintanilla',
          'Teauizje Shelton','Tiffany Alexander-Ruetz','Torri Willis','Tristan Clemons',
          'Vega Rodriguez','Wendi Hiatt','Whitney Bidondo','Yang Suemitsu-Nix','Z Brewer','Zoe Walchli');;
        label: "Rollout Group 5"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
