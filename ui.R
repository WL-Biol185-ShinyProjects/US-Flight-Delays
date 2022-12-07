library(shiny)
library(shinydashboard)
library(leaflet)
library(DT)




dashboardPage(
  dashboardHeader(title = "US Flight Status Analyzer"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Flight Delay Analysis", tabName = "predictor"),
      menuItem("Flights Data", tabName = "data"),
      menuItem("Map of US Airports and IDs", tabName = "map"),
      menuItem("About", tabName = "about"),
      selectInput("year","Select Year", c("2018" = "2018.RDS",
                                          "2020" = "2020.RDS",
                                          "2022" = "2022.RDS"))
                )
  ),
    
  dashboardBody(
    tabItems(
      tabItem(tabName = "predictor",
            h2("Flight Delay Analysis"),
            fluidRow(
              tabBox(
                title = "Output",
                # The id lets us use input$tabset1 on the server to find the current tab
                id = "tabset1", height = "250px",
                tabPanel("Dates", "Your flight vs. Other Dates", plotOutput("plot1"),
                         selectInput("origin", "Origin (Airport):", c("GJT", "HRL", "DRO", "IAH", "DEN", "TYS", "MOB", "LNK", "BHM", "IAD", "ECP", "AEX", "LFT", "BTR", "ABQ", "BUF", "ALB", "HSV",
                                                                      "TUL", "CPR", "CRP", "EWR", "DCA", "STL", "CVG", "RIC", "PVD", "CLT", "GSO", "ERI", "ORD", "LEX", "ABE", "CAK", "AVL", "DAY",
                                                                      "CHO", "ROA", "PWM", "LIT", "MKE", "BTV", "OMA", "GRB", "MLI", "SDF", "FNT", "CHS", "PIT", "TVC", "ATW", "DLH", "ROC", "SPI",
                                                                      "HPN", "MBS", "CID", "MYR", "CAE", "SGF", "AVP", "GRR", "DSM", "CLE", "PIA", "MSN", "MDT", "SBN", "MEM", "ICT", "SHV", "XNA",
                                                                      "DIK", "GPT", "PNS", "LRD", "LCH", "MFE", "FLG", "BRO", "SAF", "PQI", "ORF", "LGA", "SYR", "RDU", "ILM", "IND", "PHL", "CMH",
                                                                      "SCE", "ITH", "JAX", "OKC", "JAN", "GSP", "TXK", "ELP", "MAF", "AUS", "IDA", "BNA", "SAV", "AMA", "ATL", "BDL", "BLI", "BOI",
                                                                      "BOS", "BUR", "BWI", "BZN", "COS", "DAL", "DTW", "EUG", "FAT", "FLL", "GEG", "HDN", "HNL", "HOU", "ISP", "ITO", "KOA", "LAS",
                                                                      "LAX", "LBB", "LGB", "LIH", "MCI", "MCO", "MDW", "MHT", "MIA", "MSP", "MSY", "MTJ", "OAK", "OGG", "ONT", "PBI", "PDX", "PHX",
                                                                      "PSP", "RNO", "RSW", "SAN", "SAT", "SBA", "SEA", "SFO", "SJC", "SJU", "SLC", "SMF", "SNA", "SRQ", "TPA", "TUS", "VPS", "DFW",
                                                                      "HHH", "BFL", "FAR", "YUM", "MLB", "FSD", "MRY", "BMI", "RAP", "DAB", "FAY", "GNV", "MGM", "STS", "TLH", "MFR", "JFK", "AGS",
                                                                      "EYW", "ORH", "BGR", "CHA", "CRW", "BQK", "OAJ", "LAN", "AZO", "DHN", "TRI", "BIS", "VLD", "ABY", "GTR", "MLU", "MOT", "RST",
                                                                      "CWA", "CSG", "EVV", "GFK", "FWA", "BGM", "STT", "EGE", "JAC", "MSO", "STX", "GUC", "PHF", "PGV", "ART", "HTS", "LYH", "FLO",
                                                                      "SBY", "ADQ", "ANC", "BET", "BRW", "SCC", "JNU", "KTN", "CDV", "YAK", "FAI", "SIT", "PSG", "WRG", "OME", "OTZ", "PAE", "ADK",
                                                                      "BQN", "PSE", "BIL", "FCA", "TTN", "ILG", "SWF", "USA", "SFB", "PIE", "AZA", "RFD", "GRI", "PBG", "PGD", "PVU", "TOL", "BLV",
                                                                      "LCK", "ELM", "PSM", "SCK", "IAG", "PSC", "CKB", "STC", "HGR", "OWB", "SMX", "GTF", "RDM", "OGD", "PPG", "GCK", "ACT", "ALO",
                                                                      "LAW", "GGG", "COU", "SPS", "ABI", "CMI", "DRT", "FSM", "LSE", "TYR", "GRK", "DBQ", "BPT", "MHK", "SJT", "SWO", "MQT", "SBP",
                                                                      "CLL", "ACY", "LBE", "EWN", "ROW", "SGU", "ACV", "ASE", "XWA", "HLN", "OTH", "SLN", "LWS", "HOB", "HYS", "ALS", "CNY", "RKS",
                                                                      "DVL", "JMS", "PAH", "PRC", "RIW", "BFF", "DDC", "SUX", "CMX", "MEI", "JLN", "EAU", "GCC", "SHR", "TBN", "FOD", "LAR", "VEL",
                                                                      "OGS", "PUB", "VCT", "DEC", "CYS", "LBF", "JST", "MCW", "RDD", "SHD", "CGI", "EAR", "MKG", "LWB", "LBL", "COD", "PIB", "BTM",
                                                                      "SUN", "IMT", "RHI", "ESC", "APN", "ABR", "PLN", "INL", "BRD", "HIB", "CIU", "PIH", "TWF", "EKO", "BJI", "CDC", "YKM", "PUW",
                                                                      "ALW", "EAT", "DLG", "AKN", "GUM", "SPN", "BIH", "MMH", "ISN", "UIN", "MKK", "LNY", "JHM", "ROP", "YNG", "DUT", "ACK", "MVY",
                                                                      "BKG", "HVN", "IPT", "CDB", "HYA", "ATY", "PIR", "WYS", "GST")),
                         ##  actionButton('obutton', 'Submit', class = 'btn-outline-primary', type = 'submit'),
                         selectInput("destination", "Destination (Airport):", c("GJT", "HRL", "DRO", "IAH", "DEN", "TYS", "MOB", "LNK", "BHM", "IAD", "ECP", "AEX", "LFT", "BTR", "ABQ", "BUF", "ALB", "HSV",
                                                                                "TUL", "CPR", "CRP", "EWR", "DCA", "STL", "CVG", "RIC", "PVD", "CLT", "GSO", "ERI", "ORD", "LEX", "ABE", "CAK", "AVL", "DAY",
                                                                                "CHO", "ROA", "PWM", "LIT", "MKE", "BTV", "OMA", "GRB", "MLI", "SDF", "FNT", "CHS", "PIT", "TVC", "ATW", "DLH", "ROC", "SPI",
                                                                                "HPN", "MBS", "CID", "MYR", "CAE", "SGF", "AVP", "GRR", "DSM", "CLE", "PIA", "MSN", "MDT", "SBN", "MEM", "ICT", "SHV", "XNA",
                                                                                "DIK", "GPT", "PNS", "LRD", "LCH", "MFE", "FLG", "BRO", "SAF", "PQI", "ORF", "LGA", "SYR", "RDU", "ILM", "IND", "PHL", "CMH",
                                                                                "SCE", "ITH", "JAX", "OKC", "JAN", "GSP", "TXK", "ELP", "MAF", "AUS", "IDA", "BNA", "SAV", "AMA", "ATL", "BDL", "BLI", "BOI",
                                                                                "BOS", "BUR", "BWI", "BZN", "COS", "DAL", "DTW", "EUG", "FAT", "FLL", "GEG", "HDN", "HNL", "HOU", "ISP", "ITO", "KOA", "LAS",
                                                                                "LAX", "LBB", "LGB", "LIH", "MCI", "MCO", "MDW", "MHT", "MIA", "MSP", "MSY", "MTJ", "OAK", "OGG", "ONT", "PBI", "PDX", "PHX",
                                                                                "PSP", "RNO", "RSW", "SAN", "SAT", "SBA", "SEA", "SFO", "SJC", "SJU", "SLC", "SMF", "SNA", "SRQ", "TPA", "TUS", "VPS", "DFW",
                                                                                "HHH", "BFL", "FAR", "YUM", "MLB", "FSD", "MRY", "BMI", "RAP", "DAB", "FAY", "GNV", "MGM", "STS", "TLH", "MFR", "JFK", "AGS",
                                                                                "EYW", "ORH", "BGR", "CHA", "CRW", "BQK", "OAJ", "LAN", "AZO", "DHN", "TRI", "BIS", "VLD", "ABY", "GTR", "MLU", "MOT", "RST",
                                                                                "CWA", "CSG", "EVV", "GFK", "FWA", "BGM", "STT", "EGE", "JAC", "MSO", "STX", "GUC", "PHF", "PGV", "ART", "HTS", "LYH", "FLO",
                                                                                "SBY", "ADQ", "ANC", "BET", "BRW", "SCC", "JNU", "KTN", "CDV", "YAK", "FAI", "SIT", "PSG", "WRG", "OME", "OTZ", "PAE", "ADK",
                                                                                "BQN", "PSE", "BIL", "FCA", "TTN", "ILG", "SWF", "USA", "SFB", "PIE", "AZA", "RFD", "GRI", "PBG", "PGD", "PVU", "TOL", "BLV",
                                                                                "LCK", "ELM", "PSM", "SCK", "IAG", "PSC", "CKB", "STC", "HGR", "OWB", "SMX", "GTF", "RDM", "OGD", "PPG", "GCK", "ACT", "ALO",
                                                                                "LAW", "GGG", "COU", "SPS", "ABI", "CMI", "DRT", "FSM", "LSE", "TYR", "GRK", "DBQ", "BPT", "MHK", "SJT", "SWO", "MQT", "SBP",
                                                                                "CLL", "ACY", "LBE", "EWN", "ROW", "SGU", "ACV", "ASE", "XWA", "HLN", "OTH", "SLN", "LWS", "HOB", "HYS", "ALS", "CNY", "RKS",
                                                                                "DVL", "JMS", "PAH", "PRC", "RIW", "BFF", "DDC", "SUX", "CMX", "MEI", "JLN", "EAU", "GCC", "SHR", "TBN", "FOD", "LAR", "VEL",
                                                                                "OGS", "PUB", "VCT", "DEC", "CYS", "LBF", "JST", "MCW", "RDD", "SHD", "CGI", "EAR", "MKG", "LWB", "LBL", "COD", "PIB", "BTM",
                                                                                "SUN", "IMT", "RHI", "ESC", "APN", "ABR", "PLN", "INL", "BRD", "HIB", "CIU", "PIH", "TWF", "EKO", "BJI", "CDC", "YKM", "PUW",
                                                                                "ALW", "EAT", "DLG", "AKN", "GUM", "SPN", "BIH", "MMH", "ISN", "UIN", "MKK", "LNY", "JHM", "ROP", "YNG", "DUT", "ACK", "MVY",
                                                                                "BKG", "HVN", "IPT", "CDB", "HYA", "ATY", "PIR", "WYS", "GST")),
                         dateInput("date", "Flight Date:", format = "yy/mm/dd"),
                         selectInput('Airline', 'Airline', c("Commutair Aka Champlain Enterprises, Inc.",
                                                             "GoJet Airlines, LLC d/b/a United Express",
                                                             "Air Wisconsin Airlines Corp", "Mesa Airlines Inc.",
                                                             "Southwest Airlines Co.", 
                                                             "Republic Airlines",
                                                             "Endeavor Air Inc.", 
                                                             "American Airlines Inc.",
                                                             "Capital Cargo International",
                                                             "SkyWest Airlines Inc.",
                                                             "Alaska Airlines Inc.", 
                                                             "JetBlue Airways", 
                                                             "Delta Air Lines Inc.",
                                                             "Frontier Airlines Inc.",
                                                             "Allegiant Air",                            
                                                             "Hawaiian Airlines Inc.",
                                                             "Envoy Air", 
                                                             "Spirit Air Lines",
                                                             "Comair Inc.", 
                                                             "Horizon Air",                              
                                                             "United Air Lines Inc.",
                                                             "ExpressJet Airlines Inc.",
                                                             "Empire Airlines Inc.",
                                                             "Trans States Airlines",
                                                             "Cape Air",                                 
                                                             "Compass Airlines", 
                                                             "Virgin America", 
                                                             "Peninsula Airways Inc."))),
                tabPanel("Origins", 
                         "Choose an origin",
                         plotOutput("plot2"),
                         selectInput("origin2", "Origin (Airport):", c("GJT", "HRL", "DRO", "IAH", "DEN", "TYS", "MOB", "LNK", "BHM", "IAD", "ECP", "AEX", "LFT", "BTR", "ABQ", "BUF", "ALB", "HSV",
                                                                       "TUL", "CPR", "CRP", "EWR", "DCA", "STL", "CVG", "RIC", "PVD", "CLT", "GSO", "ERI", "ORD", "LEX", "ABE", "CAK", "AVL", "DAY",
                                                                       "CHO", "ROA", "PWM", "LIT", "MKE", "BTV", "OMA", "GRB", "MLI", "SDF", "FNT", "CHS", "PIT", "TVC", "ATW", "DLH", "ROC", "SPI",
                                                                       "HPN", "MBS", "CID", "MYR", "CAE", "SGF", "AVP", "GRR", "DSM", "CLE", "PIA", "MSN", "MDT", "SBN", "MEM", "ICT", "SHV", "XNA",
                                                                       "DIK", "GPT", "PNS", "LRD", "LCH", "MFE", "FLG", "BRO", "SAF", "PQI", "ORF", "LGA", "SYR", "RDU", "ILM", "IND", "PHL", "CMH",
                                                                       "SCE", "ITH", "JAX", "OKC", "JAN", "GSP", "TXK", "ELP", "MAF", "AUS", "IDA", "BNA", "SAV", "AMA", "ATL", "BDL", "BLI", "BOI",
                                                                       "BOS", "BUR", "BWI", "BZN", "COS", "DAL", "DTW", "EUG", "FAT", "FLL", "GEG", "HDN", "HNL", "HOU", "ISP", "ITO", "KOA", "LAS",
                                                                       "LAX", "LBB", "LGB", "LIH", "MCI", "MCO", "MDW", "MHT", "MIA", "MSP", "MSY", "MTJ", "OAK", "OGG", "ONT", "PBI", "PDX", "PHX",
                                                                       "PSP", "RNO", "RSW", "SAN", "SAT", "SBA", "SEA", "SFO", "SJC", "SJU", "SLC", "SMF", "SNA", "SRQ", "TPA", "TUS", "VPS", "DFW",
                                                                       "HHH", "BFL", "FAR", "YUM", "MLB", "FSD", "MRY", "BMI", "RAP", "DAB", "FAY", "GNV", "MGM", "STS", "TLH", "MFR", "JFK", "AGS",
                                                                       "EYW", "ORH", "BGR", "CHA", "CRW", "BQK", "OAJ", "LAN", "AZO", "DHN", "TRI", "BIS", "VLD", "ABY", "GTR", "MLU", "MOT", "RST",
                                                                       "CWA", "CSG", "EVV", "GFK", "FWA", "BGM", "STT", "EGE", "JAC", "MSO", "STX", "GUC", "PHF", "PGV", "ART", "HTS", "LYH", "FLO",
                                                                       "SBY", "ADQ", "ANC", "BET", "BRW", "SCC", "JNU", "KTN", "CDV", "YAK", "FAI", "SIT", "PSG", "WRG", "OME", "OTZ", "PAE", "ADK",
                                                                       "BQN", "PSE", "BIL", "FCA", "TTN", "ILG", "SWF", "USA", "SFB", "PIE", "AZA", "RFD", "GRI", "PBG", "PGD", "PVU", "TOL", "BLV",
                                                                       "LCK", "ELM", "PSM", "SCK", "IAG", "PSC", "CKB", "STC", "HGR", "OWB", "SMX", "GTF", "RDM", "OGD", "PPG", "GCK", "ACT", "ALO",
                                                                       "LAW", "GGG", "COU", "SPS", "ABI", "CMI", "DRT", "FSM", "LSE", "TYR", "GRK", "DBQ", "BPT", "MHK", "SJT", "SWO", "MQT", "SBP",
                                                                       "CLL", "ACY", "LBE", "EWN", "ROW", "SGU", "ACV", "ASE", "XWA", "HLN", "OTH", "SLN", "LWS", "HOB", "HYS", "ALS", "CNY", "RKS",
                                                                       "DVL", "JMS", "PAH", "PRC", "RIW", "BFF", "DDC", "SUX", "CMX", "MEI", "JLN", "EAU", "GCC", "SHR", "TBN", "FOD", "LAR", "VEL",
                                                                       "OGS", "PUB", "VCT", "DEC", "CYS", "LBF", "JST", "MCW", "RDD", "SHD", "CGI", "EAR", "MKG", "LWB", "LBL", "COD", "PIB", "BTM",
                                                                       "SUN", "IMT", "RHI", "ESC", "APN", "ABR", "PLN", "INL", "BRD", "HIB", "CIU", "PIH", "TWF", "EKO", "BJI", "CDC", "YKM", "PUW",
                                                                       "ALW", "EAT", "DLG", "AKN", "GUM", "SPN", "BIH", "MMH", "ISN", "UIN", "MKK", "LNY", "JHM", "ROP", "YNG", "DUT", "ACK", "MVY",
                                                                       "BKG", "HVN", "IPT", "CDB", "HYA", "ATY", "PIR", "WYS", "GST")),
                        sliderInput("binwidth", "Number of Bins", 0 , 50, 25)
              ),
              tabPanel("Destinations",
                     "Choose a destination",
                     plotOutput("plot3"),
                     selectInput("destination2", "Destination (Airport):", c("GJT", "HRL", "DRO", "IAH", "DEN", "TYS", "MOB", "LNK", "BHM", "IAD", "ECP", "AEX", "LFT", "BTR", "ABQ", "BUF", "ALB", "HSV",
                                                                            "TUL", "CPR", "CRP", "EWR", "DCA", "STL", "CVG", "RIC", "PVD", "CLT", "GSO", "ERI", "ORD", "LEX", "ABE", "CAK", "AVL", "DAY",
                                                                            "CHO", "ROA", "PWM", "LIT", "MKE", "BTV", "OMA", "GRB", "MLI", "SDF", "FNT", "CHS", "PIT", "TVC", "ATW", "DLH", "ROC", "SPI",
                                                                            "HPN", "MBS", "CID", "MYR", "CAE", "SGF", "AVP", "GRR", "DSM", "CLE", "PIA", "MSN", "MDT", "SBN", "MEM", "ICT", "SHV", "XNA",
                                                                            "DIK", "GPT", "PNS", "LRD", "LCH", "MFE", "FLG", "BRO", "SAF", "PQI", "ORF", "LGA", "SYR", "RDU", "ILM", "IND", "PHL", "CMH",
                                                                            "SCE", "ITH", "JAX", "OKC", "JAN", "GSP", "TXK", "ELP", "MAF", "AUS", "IDA", "BNA", "SAV", "AMA", "ATL", "BDL", "BLI", "BOI",
                                                                            "BOS", "BUR", "BWI", "BZN", "COS", "DAL", "DTW", "EUG", "FAT", "FLL", "GEG", "HDN", "HNL", "HOU", "ISP", "ITO", "KOA", "LAS",
                                                                            "LAX", "LBB", "LGB", "LIH", "MCI", "MCO", "MDW", "MHT", "MIA", "MSP", "MSY", "MTJ", "OAK", "OGG", "ONT", "PBI", "PDX", "PHX",
                                                                            "PSP", "RNO", "RSW", "SAN", "SAT", "SBA", "SEA", "SFO", "SJC", "SJU", "SLC", "SMF", "SNA", "SRQ", "TPA", "TUS", "VPS", "DFW",
                                                                            "HHH", "BFL", "FAR", "YUM", "MLB", "FSD", "MRY", "BMI", "RAP", "DAB", "FAY", "GNV", "MGM", "STS", "TLH", "MFR", "JFK", "AGS",
                                                                            "EYW", "ORH", "BGR", "CHA", "CRW", "BQK", "OAJ", "LAN", "AZO", "DHN", "TRI", "BIS", "VLD", "ABY", "GTR", "MLU", "MOT", "RST",
                                                                            "CWA", "CSG", "EVV", "GFK", "FWA", "BGM", "STT", "EGE", "JAC", "MSO", "STX", "GUC", "PHF", "PGV", "ART", "HTS", "LYH", "FLO",
                                                                            "SBY", "ADQ", "ANC", "BET", "BRW", "SCC", "JNU", "KTN", "CDV", "YAK", "FAI", "SIT", "PSG", "WRG", "OME", "OTZ", "PAE", "ADK",
                                                                            "BQN", "PSE", "BIL", "FCA", "TTN", "ILG", "SWF", "USA", "SFB", "PIE", "AZA", "RFD", "GRI", "PBG", "PGD", "PVU", "TOL", "BLV",
                                                                            "LCK", "ELM", "PSM", "SCK", "IAG", "PSC", "CKB", "STC", "HGR", "OWB", "SMX", "GTF", "RDM", "OGD", "PPG", "GCK", "ACT", "ALO",
                                                                            "LAW", "GGG", "COU", "SPS", "ABI", "CMI", "DRT", "FSM", "LSE", "TYR", "GRK", "DBQ", "BPT", "MHK", "SJT", "SWO", "MQT", "SBP",
                                                                            "CLL", "ACY", "LBE", "EWN", "ROW", "SGU", "ACV", "ASE", "XWA", "HLN", "OTH", "SLN", "LWS", "HOB", "HYS", "ALS", "CNY", "RKS",
                                                                            "DVL", "JMS", "PAH", "PRC", "RIW", "BFF", "DDC", "SUX", "CMX", "MEI", "JLN", "EAU", "GCC", "SHR", "TBN", "FOD", "LAR", "VEL",
                                                                            "OGS", "PUB", "VCT", "DEC", "CYS", "LBF", "JST", "MCW", "RDD", "SHD", "CGI", "EAR", "MKG", "LWB", "LBL", "COD", "PIB", "BTM",
                                                                            "SUN", "IMT", "RHI", "ESC", "APN", "ABR", "PLN", "INL", "BRD", "HIB", "CIU", "PIH", "TWF", "EKO", "BJI", "CDC", "YKM", "PUW",
                                                                            "ALW", "EAT", "DLG", "AKN", "GUM", "SPN", "BIH", "MMH", "ISN", "UIN", "MKK", "LNY", "JHM", "ROP", "YNG", "DUT", "ACK", "MVY",
                                                                            "BKG", "HVN", "IPT", "CDB", "HYA", "ATY", "PIR", "WYS", "GST")),
                     sliderInput("binwidth2", "Number of Bins", 0 , 50, 25)
                     ),
              tabPanel("Airlines",
                       "Choose an Airline",
                       plotOutput("plot4"),
                       selectInput("airline2", "Airline:", c("Commutair Aka Champlain Enterprises, Inc.",
                                                             "GoJet Airlines, LLC d/b/a United Express",
                                                             "Air Wisconsin Airlines Corp", "Mesa Airlines Inc.",
                                                             "Southwest Airlines Co.", 
                                                             "Republic Airlines",
                                                             "Endeavor Air Inc.", 
                                                             "American Airlines Inc.",
                                                             "Capital Cargo International",
                                                             "SkyWest Airlines Inc.",
                                                             "Alaska Airlines Inc.", 
                                                             "JetBlue Airways", 
                                                             "Delta Air Lines Inc.",
                                                             "Frontier Airlines Inc.",
                                                             "Allegiant Air",                            
                                                             "Hawaiian Airlines Inc.",
                                                             "Envoy Air", 
                                                             "Spirit Air Lines",
                                                             "Comair Inc.", 
                                                             "Horizon Air",                              
                                                             "United Air Lines Inc.",
                                                             "ExpressJet Airlines Inc.",
                                                             "Empire Airlines Inc.",
                                                             "Trans States Airlines",
                                                             "Cape Air",                                 
                                                             "Compass Airlines", 
                                                             "Virgin America", 
                                                             "Peninsula Airways Inc.")),
                       
                       sliderInput("binwidth3", "Number of Bins", 0 , 50, 25)
                       
                       )
              
            )
          )
        ),
      

      tabItem(tabName = "data",
              h2("Flights Table:"),
              fluidRow(
                box(
                  dataTableOutput("table"),
                  downloadLink('download', "Download this data")),
               )
              ), 
      tabItem(tabName = "map",
              h2("Map of US Airports and IDs"), 
              fluidPage(
                leafletOutput("mymap", width = 1800, height = 1000)
              )
      ), 
      tabItem(tabName = "about",
              h2("About our Project"),
              fluidPage(
                box(
                  "This project features data from 2018, 2020, and 2022. Users can view historical delay data from 
                  most US airports in order to make the most informed decisions possible about the destination or 
                  departure point through which they want to fly.
                  
                  Furthermore, users can select the destination airport, departure airport, and their desired flight 
                  date so as to see which dates have historically been the worst (or best) to fly on.
                  
                  Lastly, users can view a map showing information on US airports, and both peruse and download the
                  data involved in the project.
                  
                  Users can see the original data here: https://www.kaggle.com/datasets/robikscube/flight-delay-dataset-20182022?resource=download&select=Combined_Flights_2022.parquet"
                )
              )
              )
      
    )
              
            ),
)

  
  
  
  
  
  
  










