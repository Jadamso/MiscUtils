#------------------------------------------------------------------
##################
# Add Divisions Information
##################
#http://www2.census.gov/geo/docs/maps-data/maps/reg_div.txt

# Division I: New England 
DIV1 <- rbind( 
    c('Connecticut     ','09', '01'),
    c('Maine           ','23', '01'),
    c('Massachusetts   ','25', '01'),
    c('New Hampshire   ','33', '01'),
    c('Rhode Island    ','44', '01'),
    c('Vermont         ','50', '01'))

# Division 2: Middle Atlantic
DIV2 <- rbind( 
    c('New Jersey      ','34', '02'),
    c('New York        ','36', '02'),
    c('Pennsylvania    ','42', '02'))

# Division 3:  East North Central
DIV3 <- rbind(
    c('Illinois        ','17', '03'),
    c('Indiana         ','18', '03'),
    c('Michigan        ','26', '03'),
    c('Ohio            ','39', '03'),
    c('Wisconsin       ','55', '03'))

# Division 4:  West North Central
DIV4 <- rbind( 
    c('Iowa            ','19', '04'),
    c('Kansas          ','20', '04'),
    c('Minnesota       ','27', '04'),
    c('Missouri        ','29', '04'),
    c('Nebraska        ','31', '04'),
    c('North Dakota    ','38', '04'),
    c('South Dakota    ','46', '04'))

# Division 5: South Atlantic
DIV5 <- rbind( 
    c('Delaware        ','10', '05'),
    c('District of Columbia','11', '05'),
    c('Florida         ','12', '05'),
    c('Georgia         ','13', '05'),
    c('Maryland        ','24', '05'),
    c('North Carolina  ','37', '05'),
    c('South Carolina  ','45', '05'),
    c('Virginia        ','51', '05'),
    c('West Virginia   ','54', '05'))

# Division 6: East South Central
DIV6 <- rbind( 
    c('Alabama         ','01', '06'),
    c('Kentucky        ','21', '06'),
    c('Mississippi     ','28', '06'),
    c('Tennessee       ','47', '06'))

#Division 7: West South Central
DIV7 <- rbind( 
    c('Arkansas        ','05', '07'),
    c('Louisiana       ','22', '07'),
    c('Oklahoma        ','40', '07'),
    c('Texas           ','48', '07'))

# Division 8: Mountain
DIV8 <- rbind( 
    c('Arizona         ','04', '08'),
    c('Colorado        ','08', '08'),
    c('Idaho           ','16', '08'),
    c('Montana         ','30', '08'),
    c('Nevada          ','32', '08'),
    c('New Mexico      ','35', '08'),
    c('Utah            ','49', '08'),
    c('Wyoming         ','56', '08'))

# Division 9: Pacific
DIV9 <- rbind( 
    c('Alaska          ','02', '09'),
    c('California      ','06', '09'),
    c('Hawaii          ','15', '09'),
    c('Oregon          ','41', '09'),
    c('Washington      ','53', '09'))


DIVISIONS <- do.call("rbind", 
    list(DIV1,DIV2,DIV3,DIV4,DIV5,DIV6,DIV7,DIV8,DIV9) )
DIVISIONS <- as.data.frame(DIVISIONS)


DIVISIONS[,2] <- as.numeric(DIVISIONS[,2])
DIVISIONS[,3] <- as.numeric(DIVISIONS[,3])
DIVISIONS[,4] <- cut( DIVISIONS[,3] , c(00,02,04,07,09), right=T)

names(DIVISIONS) <- c("State","StateID","Division","Region")

#save(DIVISIONS, file=paste0(ddir,"DIVISIONS.Rdata") )

#------------------------------------------------------------------
##################
# Add Regions Information
##################

#WEST
    #Division 8: Mountain
    #Division 7: West South Central
    #REGION4 <- c(DIV8,DIV9)
#SOUTH
    #Division 5: South Atlantic
    #Division 6: East South Central
    #Division 7: West South Central
    #REGION3 <- c(DIV5,DIV6,DIV7)
#MIDWEST
    #Division 3: East North Central
    #Division 4: West North Central
    #REGION2 <- c(DIV3,DIV4)
#NORTHEAST
    #Division I: New England
    #Division 2: Middle Atlantic
    #REGION1 <- c(DIV1,DIV2)


DIVfips <- match(
    as.character(DF$State),
    sprintf("%02d",DIVISIONS[,"StateID"]) )

DF$Div     <- as.factor( DIVISIONS[DIVfips, "Division"] )
DF$Region  <- as.factor( DIVISIONS[DIVfips, "Region"] )


