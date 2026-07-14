-- Major Chooser MySQL schema and seed data

-- Database creation
CREATE DATABASE IF NOT EXISTS major_chooser
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
  
  
USE major_chooser;

-- Drop existing tables
DROP TABLE IF EXISTS question_weights;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS majors;

CREATE TABLE majors (
  id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  college VARCHAR(255) NOT NULL,
  academics TEXT,
  experience TEXT,
  opportunities TEXT,
  base_affinity INT NOT NULL DEFAULT 10
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE questions (
  id INT PRIMARY KEY,
  `text` TEXT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE question_weights (
  id INT PRIMARY KEY AUTO_INCREMENT,
  question_id INT NOT NULL,
  major_id INT NOT NULL,
  weight INT NOT NULL DEFAULT 0,
  UNIQUE KEY uq_question_major (question_id, major_id),
  FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
  FOREIGN KEY (major_id) REFERENCES majors(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO majors (id, name, college, academics, experience, opportunities, base_affinity) VALUES
(1, 'Accounting', 'College of Business', 'Students gain a solid foundation of accounting technical expertise and business insights, develop research and communication skills, become sensitive to ethical business practices, and interact with accounting and business professional communities. Internships before graduation are also common.', 'Opportunities exist in public accounting, industry, government, and not-for-profit organizations. Graduates may specialize in general accounting, taxation, or auditing. Other specializations exist in taxation, forensic accounting, and accounting systems, with professional certifications such as Certified Public Accountant (CPA), Certified Fraud Examiner (CFE), Certified Financial Planner (CFP), Certified Management Accountant (CMA), and many others.', 'The Public Accounting Report national ranking of Top 25 accounting programs places UNL''s School of Accountancy undergraduate program 14th and its graduate program at 23rd for mid-size accounting programs.The accounting program is also accredited by the Association to Advance Collegiate Schools of Business (AACSB). Only 175 accounting programs world-wide hold this accreditation including less than 20 percent of accounting programs in the United States.', 10),
(2, 'Acting', 'Hixson-Lied College of Fine and Performing Arts', 'This emphasis offers comprehensive actor training through a core of 8 different acting courses, which move from basic process work to detailed exploration of specific technical and stylistic demands.The emphasis also offers up to 4 semesters each of voice and speech training, and movement training.', 'Students are prepared for careers in acting and related activities.', 'Facilities feature 4 production spaces (including a sound stage) and enviable classroom and shop areas offering one of the finest centers of theatrical training in the Midwest.', 10),
(3, 'Actuarial Science', 'College of Business', 'The work of an actuary typically involves analyzing the various contingencies (birth, death, marriage, retirement, sickness, and losses due to accidents or negligence), which face society, and their impact on the many types of financial security arrangements, both public and private. A creative aspect of actuarial work lies in the forecasting of events. Actuaries are frequently called upon to make decisions that affect the fiscal soundness of financial security programs well into the future. Quality actuaries are in high demand resulting in a high job placement rate and high starting salaries.', 'With a professional degree in actuarial science, careers are possible in Consulting Actuaries, Public and Private Sectors including, Government, Insurance, Social Security Administration and Financial Services.', 'We have been consistently ranked as one of the best programs in the nation, with a joint program between the College of Arts and Sciences and the College of Business. We hold the CAE designation by the Society of Actuaries and are one of the few complete actuarial science programs in the U.S., and many employers visit the campus to recruit top students from our program.Another benefit of our program is that we have full-time actuarial science professors, and are one of the few campuses with two Fellow of the Society of Actuaries (FSA) on its faculty. Our faculty uses the most current material published by the Society of Actuaries which prepares students for the professional actuarial examinations.The students also have the opportunity to be a part of Actuarial Science Club which adds an extra dimension to the course work and provides an opportunity to hear national experts speak on actuarial topics.', 10),
(4, 'Anthropology', 'College of Arts and Sciences', 'Anthropology studies the full range of the human experience from human origins and prehistoric cultures to traditional and modern societies. While anthropology documents human behavior and cultural patterns around the world, it is also concerned with preserving cultural diversity and improving the lives of peoples who live in today''s changing world.When you major in anthropology, your core classes will introduce you to prehistory, cultural and physical anthropologyAdvanced courses offered in archaeology, biological anthropology and cultural anthropology include:
North American Archaeology
Old World Prehistory
Medical Anthropology
Human Growth and Development
Ecological Anthropology
Social Structure
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in anthropology such as:
Studying abroad in Benin learning about culture and agriculture
Serving as the AnthroGroup president
Interning with the Smithsonian Institution
Researching 3D scanning as a means to study pottery
Volunteering with the Nebraska State Historical Society
', 'As an anthropology major you will have career opportunities in many fields. You might find work with an international business or an agency involved with international development. Anthropology training can lead to careers in intercultural education, health care and human services. You may do cultural preservation and interpretation in parks and public lands. Here are examples of recent graduates'' employment:
Editor/Analyst / THE MOTLEY FOOL
Forestry Technician / US FOREST SERVICE
Geologist / FULBRIGHT
Healthy Lifestyle Educator / CLYDE MALONE COMMUNITY CENTER
Integrated Resource Technician / NATIONAL PARK SERVICE
Personal Banker / WELLS FARGO
Primary Education Teacher Trainer / PEACE CORPS
Projects Coordinator of Student Life / PERU STATE COLLEGE
VISTA Leader Position / AMERICORPS
Youth Programmer / ASIAN COMMUNITY AND CULTURAL CENTER
', 10),
(5, 'Architecture', 'College of Architecture', 'Architecture students develop the foundation skills and abilities to create complex built environments. Additionally, students confront technical problems, address human needs and resolve esthetic concerns. Confronting these issues requires a vision for the future that includes zero energy building technologies and more integrated design and building delivery models. Within these emerging realities, students will increasingly be required to be creative and adaptable to changes in building culture and the leadership role an architect plays in a community''s development. To prepare students for this challenge, Nebraska''s architecture program provides a broad understanding of the arts and humanities as well as the specifics of technology.', 'While the typical goal of pursing a degree in Architecture is to become a licensed architect, design is an increasingly broad arena in our culture. An architectural education prepares students to be creative and adaptable in roles from the technical to the esthetic. Many of our students continue with dual majors in business, engineering, landscape, or community and regional planning.', 'The Architecture Program is housed in the award-winning Architecture Hall, one of the oldest and yet most up-to-date buildings on campus. Beginning in your third year, you will be provided with an individualized work space within Architecture Hall and with ready access to its resources. Within Architecture Hall, students will find a dedicated branch library, gallery, computer lab, media center with large and small format printing capability, photo studio and darkroom facilities, a fully equipped shop with wood and metal capabilities, and two laser cutters with a 3D printer.', 10),
(6, 'Art', 'Hixson-Lied College of Fine and Performing Arts', 'Beginning with visual literacy, students investigate the ways society communicates beliefs and values through the artifacts we make.You''ll develop an expanded awareness of your surroundings and an understanding of the potential for visual images and constructed artifacts to express your own ideas and observations about the world.Graphic Design is now a major at the University of Nebraska–Lincoln. For more information visit: http://arts.unl.edu/art/graphic-designChoose an emphasis in one or more of the following areas including:
ceramics
drawing
painting
photography
printmaking
sculpture
', 'Majoring in art is a first step toward a career as a:
studio artist
arts administrator
art instructor
gallery manager
graphic designer
illustrator
museum worker
restoration specialist
web designer
and many other careers
Opportunities depend largely on your interests and initiatives.Students who pursue the Bachelor of Fine Arts are better prepared to continue their education in studio art at the graduate level, and for employment as artists, while students who work toward the Bachelor of Arts are prepared for careers in fields where a broader, liberal arts education is an asset.', 'The arts major has 3 notable facilities including:
Eisentrager•Howard Gallery
Richards Hall
Woods Art Building
', 10),
(7, 'Biochemistry', 'College of Arts and Sciences', 'As a major in biochemistry, you will study the molecules that make up life! Biochemistry explores the study of chemical reactions within a living cell with applications ranging from pharmaceuticals to biofuels. Our faculty use a teaching style that emphasizes core concepts and actively incorporates teamwork, problem-solving and project management skills into our lecture and lab courses.Biochemistry includes preparation in chemistry, biology, physics, and calculus.Beyond the core requirements, you will have the opportunity to enroll in elective courses including:
Research Techniques in Biochemistry
Plant Biochemistry
Computational Biology
OR, Advanced Topics in Biophysical Chemistry
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in biochemistry such as:
Researching alongside faculty in our Redox Biology Center
Becoming an Associate Management Intern at Cargill
Studying abroad in Peru with Nebraska''s affiliated GREEN Program for Water Resource Management and Sustainable Practices
Running for president of the Biochemistry Club
Volunteer with the People''s City Mission
', 'Career opportunities with the bachelor of science degree include entry-level positions as a research technologist in biomedical, pharmaceutical and agricultural labs. You can combine communication skills with a science background to work in education, business or government agencies. The majority of our students pursue advanced degrees —including health professions, secondary education and the molecular life sciences. These professionals have a profound effect on our society as physicians, dentists, public policy makers, teachers and researchers. Here are examples of recent graduates'' employment:
Application Scientist / ADVANCED ANALYTICAL TECHNOLOGIES
Chemical Engineer I / BLACK VEATCH
Lab Technician I / GENESEEK / NEOGEN CORPORATION
Lab Technician II / GENESEEK
Neuromonitoring Technologist / BIOTRONIC NEURONETWORK
Research Assistant / UNIVERSITY OF NEBRASKA–LINCOLN
Research Scientist / VAJRA INSTRUMENTS
Researcher / UNIVERSITY OF NEBRASKA MEDICAL CENTER
Science Writer / LI-COR BIOSCIENCES
Scientist I / AEROTEK
', 10),
(8, 'Biological Sciences', 'College of Arts and Sciences', 'When you major in biological sciences you can explore the living world—from molecules to ecosystems! You will have the opportunity to take an anatomy course that utilizes cadavers or study at the Cedar Point Biological Station. Cedar Point offers hands-on lab and field courses during the summer where you will put concepts of biology into real-world practice in a unique setting.You are invited to explore your particular interests— microbiology, ecology, genetics or physiology—through research coursework and independent study directed by a faculty member. Requirements for the major include coursework in cell and molecular biology, biodiversity, genetics, ecology and evolution.', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in biological sciences such as:
Studying abroad in Costa Rica with the Organization for Tropical Studies
Serving as the Biology Club president
Working as the Human Anatomy Lab teaching assistant
Volunteering for the Alzheimer''s Association of Nebraska
Researching in the Center for Virology or the Center for Biotechnology
', 'Biology is a broad field providing numerous, diverse career options. You may choose to continue on to professional school for a career in clinical healthcare or work in public health, health policy or health care administration. You might choose to work as a food industry researcher, conservationist or zookeeper. You can also explore the pharmaceutical realm in sales or production. Biomedical research, genetic counseling and bioinformatics are additional career options. Here are examples of recent graduates'' employment:
Clinical Assistant / BRYAN HEALTH
Clinical Data Quality Specialist / CELERION, INC.
DNA Lab Tech / GENESEEK
Forestry Aid / UNITED STATES FOREST SERVICE
Hematology Technician I / STRECK
Hospital Generalist / PATHOLOGY MEDICAL SERVICES
Mental Health Tech / TOUCHSTONE
Physical Therapy Technician / LINCOLN PHYSICAL THERAPY ASSOCIATES
Veterinary Assistant / ANIMAL CARE CLINIC
Zookeeper / OMAHA HENRY DOORLY ZOO
', 10),
(9, 'Biological Systems Engineering', 'College of Engineering', 'Engineers in biological systems literally bring engineering to life using biology, mathematics, and engineering to improve people''s lives and the environment. Biological systems engineers are involved in intriguing areas such as:
designing medical instruments
creating new foods
developing devices to detect diseases or measuring plant and animal stresses
enhancing fuels for better efficiency
A degree in biological systems engineering offers a broad, flexible engineering background, which is important to employers.Biological systems engineering is one of the most people-oriented of all engineering disciplines, so you''ll also work on enhancing your interpersonal and communication skills.Many students work part-time on departmental research projects, gaining valuable experience for employment.', 'Biomedical engineering is the fastest growing job field in the United States, according to the U.S. Department of Labor. Projected job growth in this field from 2010-2020 is 62%.Careers include:
renewable energy
water treatment
prosthetics design
wetlands restoration
food and bioproducts development
flood mitigation and erosion control
biomedical imaging
Recent employers include:
National Instruments
State of Nebraska
Olsson Associates
Cargill
Archer Daniels Midland
Medtronic
Black & Veatch
', 'All students complete a senior capstone course in which students select semester-long design projects in their areas of interest and work as a team to solve a problem presented by clients.They apply teamwork, oral and written presentations and reports, including computer-aided drawings, specifications, and cost estimates.', 10),
(10, 'Broadcasting', 'College of Journalism and Mass Communications', 'From day one whether your dream is to be in front of or behind the camera, you are offered hands-on opportunities to learn the ins and outs of television, radio and digital audio and video production.You have the chance to help produce a live TV newscast or variety show or run their your own show on KRNU – the college''s radio station – broadcasting Husker games, reporting news or hosting an entertainment show.You can get involved with special opportunities, such as:
HuskerVision, the Athletic Department''s broadcast unit
Big Ten Network broadcasts
Hearst Journalism Awards competition
Public television and radio
', 'A degree in broadcasting can take you anywhere you dream of going. The College of Journalism and Mass Communications has the highest job placement rate at UNL, and our graduates have found careers worldwide.Our graduates are employed at top television networks, radio stations and media organizations. Some of the places our graduates find employment include:
ESPN
ABC News
Fox News
American Public Media
CNN
MTV
NBC News
CBS
', 'Our faculty and students are passionate about what they do and their research and creative activity reflects that through a variety of media - print, web, audio, photography, videos and documentaries.The college has a long history of producing award-winning depth reporting projects that have covered a variety of topics, including:
Cuba after 50 years of communist rule.
The relationship between France and the U.S.
Immigration in the state of Nebraska.
Self-rule in Bolivia.
The impact of Native American women on their society.
The birth of a nation in Kosovo.
Our student''s work in the innovative News21 program has appeared prominently in many national publications, including:
The Washington Post
MSNBC.com
The New York Times
San Francisco Chronicle
Faculty members have also created both popular and scholarly work. Some examples:
Professor John Bender''s reporting textbook is in its 10th edition.
Professor Joseph Starita''s book on a Native American family was nominated for a Pulitzer Prize.
Professor Bernard McCoy''s 2 award-winning documentaries have been televised in several major markets and screened at several film festivals.
', 10),
(11, 'Business Administration', 'College of Business', 'The degree that is granted by the college is designed to give students a broad background in business administration. Students may choose to specialize in several areas by majoring in business administration, or they can specialize by selecting one major.When specializing in several areas, students may choose courses from any of the departments within the college in any combination. For the student who has an educational goal that bridges two or more areas of business, the general business administration major permits the design of a tailor-made program to fit that goal.', 'Because the degree covers a number of business disciplines a student who majors in business administration may find themselves qualified to apply for positions in a multitude of business fields.Many organizations seek generalists rather than specialists when hiring employees. Some employers feel that in today''s world of rapid change, individuals who have a broad educational background are more adaptive to this change and are better suited to a variety of roles within the organization.', '', 10),
(12, 'Chemical Engineering', 'College of Engineering', 'Some of the exciting areas in which our chemical and biomolecular engineers are involved in include:
fighting diseases
developing nanotechnologies
creating genetically engineered medicines
designing processes for sustainable biofuels production
Our graduates work in research, design, development, production and maintenance in such industries as:
chemicals
petroleum
petrochemicals
rubber
plastics
agricultural chemicals
food
biotechnology
pharmaceuticals
paper
aircraft
automotive
electronics
energy conversion
environmental pollution prevention and control
Our students benefit from the quality, energy and ingenuity of faculty who receive grants from prestigious institutions such as the National Institutes for Health, the National Science Foundation, and the United States Army.', 'Career opportunities include:
assistant chemical engineer
chemical engineer
bioprocess scientist
chemist
hydrologist
process design engineer
production management engineer
validation engineer
Recent employers include Burns & McDonnell, Cargill, Exxon Mobil, Novartis, CEMEX, and the U.S. Geological Survey.', 'Nebraska''s CHME program helps the world by developing regenerative medical materials, advancing cutting-edge genomic techniques like ultra-fast polymerase chain reaction (PCR) against emerging diseases, generating processes for sustainable biofuels production, and discovering devices to give robots a human sense of touch using nanotechnology.', 10),
(13, 'Chemistry', 'College of Arts and Sciences', 'As a chemistry major you will gain a broad knowledge in the six major areas of chemistry: chemical education, organic, inorganic, physical, analytical and biochemistry. You will also discover the process for scientific inquiry, become proficient in modern laboratory procedures, understand the practical and ethical applications of chemical principles in society, and take part in cutting-edge research projects.Your core curriculum includes fundamental courses in chemistry, math and physics as well as specialized courses such as:
Biomolecules and Metabolism
Gene Expression and Replication
Plant Biochemistry
Science of Food
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in chemistry such as:
Studying abroad in Peru with The GREEN Program water resource management
Serving as the UNL Chemistry Club president
Interning with Novartis, a global healthcare company
Researching the "Development of Organic Radical Contrast Agents for Magnetic Resonance Imaging of Cancer"
Volunteering with JDRF International
 ', 'A major in chemistry opens the door to many careers. Some may be obvious, including pharmaceutical development, chemical research and manufacturing, analysis, and science education. Environmental science, medicine, pharmacy, forensics, plant science, and law are not as obvious. Here are examples of recent graduates'' employment:
Associate Scientist I / TEVA PHARMACEUTICAL
Chemical Analyst / PURAC AMERICA
Chemical Contractor / ZOETIS
Chemistry Lab Technician / ARKANSAS STATE UNIVERSITY
Civilian Scientist / UNITED STATES NAVY
Pharmacy Intern I / METHODIST WOMEN''S HOSPITAL
Principle Scientist 1 / NOVARTIS
Product Associate / LI-COR BIOSCIENCES
Quality Management Chemist / CARGILL
Technical Services / EPIC SYSTEMS CORPORATION
 ', 10),
(14, 'Child, Youth & Family Studies', 'College of Education and Human Sciences', 'Programs in the Child, Youth & Family Studies Department prepare students to work with diverse groups of children, families, and communities in a variety of settings. Learning about family systems and interrelationships prepares students to work with individuals and families. Our department provides comprehensive programs grounded in family science theory, research and professional practice and application. The curriculum provides students with knowledge, skills, and the ability to navigate conflict, prevent and remedy interpersonal problems, and build upon the family strengths.', 'In addition to a career in teaching opportunities for the teaching-based programs, students will also be prepared for many different career opportunities in human services including non-profit agencies, youth development agencies, and government agencies serving families and financial service agencies. Possible careers include a Family Support Specialist, Chemical Dependency Specialist, Youth Care Specialist, Halfway House Administrator, Youth Agency Director, Foster Care Specialist, Credit Union Representative, Consumer Affairs Specialist, Extension Educator, 4-H Assistant, or positions with Financial Companies. Students have also gone on for graduate schoolwork in Family Therapy, Social Work, Counseling, Psychology, and Law.', '', 10),
(15, 'Civil Engineering', 'College of Engineering', 'Civil engineers are creative problem solvers and are dedicated to protecting and enhancing our quality of life and sustaining our natural resources and energy. Civil engineering means accepting difficult science and engineering assignments and embracing the responsibility to make things better and working with people worldwide. As a civil engineer, you''ll devise and design the building of roads, bridges, airports, tunnels, dams, water and sewage systems, and/or many other structures. Civil engineering features such specialties as structural, water resources, environmental, transportation and geo-technical engineering. At UNL, you''ll have numerous opportunities to develop leadership and hands-on skills through regional and national team competitions, research with faculty, and national student organizations. Our civil engineering faculty are also heavily involved in nationally known transportation programs that have helped make NASCAR safer for racing.', 'Career opportunities with this major include positions with consulting design firms (environmental, geotechnical, structural, transportation and water resources engineering), general and specialty construction companies, industries that explore for natural resources that produce energy, municipal, county, state and federal government agencies, and many more.Recent employers include Burlington Northern Santa Fe Railroad, Federal Highway Administration, HDR Engineering, Nebraska Department of Roads, Olsson Associates, Peter Kiewit & Sons, U.S. Army Corp of Engineers, and Union Pacific Railroad.', 'Nebraska Engineering provides excellent laboratories to support civil engineering teaching and research. State-of-the-art laboratories enhance instruction in surveying and geometric controls; computer-aided civil engineering analysis and design, and environmental, geotechnical, structural, hydraulic, water resources and transportation engineering.', 10),
(16, 'Communication Studies', 'College of Arts and Sciences', 'Your major in communication studies will focus on developing intellectual capacities to advocate, negotiate and relate, putting you on a pathway to successfully navigate professional, personal and public life.In addition to the core requirements, which focus on communication, collaboration and community, you can enroll in courses like:
Intercultural Communication
Nonverbal Communication
The Dark side of Interpersonal Communication
Health Communication
Theories of Persuasion
Political Communication
Media and Culture
Global Organizational Communication
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in communication studies such as:
Studying abroad in the inspiring Veneto region of Italy
Participating on the six-time Big Ten champion Speech and Debate team
Interning with Omaha''s Henry Doorly Zoo
Researching communication techniques used in coping
Volunteering with the Center for Civic Engagement
', 'Did you know communication is the #1 skill sought by employers? As communication studies majors you will prepare yourself with the knowledge and skills necessary for entering a wide variety of career fields, such as law, politics, government, public administration, public relations, personnel management, industrial/labor relations, sales, marketing, sales management, education, health/social services, business/industry, media, performing arts, ministry, counseling, public information management and teaching as well as graduate studies in communication studies and related disciplines. Here are examples of recent graduates'' employment:
Account Manager/Marketing Consultant / THREE EAGLES COMMUNICATIONS
Behavioral Health Specialist / CHILDREN''S RESPITE CARE CENTER
Communications Outreach Specialist / NET TV
Director of CEO Communications / BACK TO THE BIBLE
Human Resources Generalist / CITY OF LINCOLN
Investment Specialist / MERRILL EDGE
Program Director / FREMONT PUBLIC SCHOOLS
Sales Operations Coordinator / HEALTHCARE
Truman Fellow/Policy Analyst / U.S. DEPARTMENT OF HEALTH AND HUMAN SERVICES
Web Design and Marketing / SIMPLIFIED OFFICE SOLUTIONS
', 10),
(17, 'Computer Engineering', 'College of Engineering', 'Computer engineering is a degree program offered by the University of Nebraska–Lincoln College of Engineering on both the Lincoln City Campus and the Omaha Campus (at The Peter Kiewit Institute). The computer engineering program on the Lincoln Campus (as part of the Computer Science and Engineering Department) is concerned with the development of computer-related technologies. The computer engineer must be prepared to deal with software and hardware development, and often works at the microchip level, using programming skills to control electronic and mechanical devices. Students in the program integrate knowledge from advanced courses in computer science and in electrical engineering, bridging both these fields.', 'With a professional degree in computer engineering, careers are possible in Software Engineering, VLSI Design Engineering, Internet Programming, Network Engineering, Firmware Development, Embedded Systems Engineering.Companies hiring computer engineering graduates include:
Boeing
Cerner
Garmin
General Electric
Hewlett-Packard
IBM
Microsoft
National Instruments
Intel
Rockwell-Collins
Transcrypt International
', 'The department classes, laboratories and offices are housed in the renovated Avery Hall and in the newly constructed Schorr Center on the City Campus. Lecture halls and primary teaching laboratories are equipped with multimedia electronics. Dual-boot Windows/Linux computers as well as all needed software are provided in laboratories, which are open for extended hours during the week and on weekends. Central Unix-based login servers are available for remote access and provide e-mail, network file storage and individual web space for computer engineering students. Many students also enjoy the convenience of their own computers, which can be connected directly to the network from residence hall rooms or through the Internet from off-campus.', 10),
(18, 'Computer Science', 'College of Engineering', 'Your major in computer science will encompass software experience to prepare you to develop the compilers and operating systems of the future, hardware experience to design the next generation computer chips in Silicon Valley and theoretical studies to advance into research in academia.Over half of your coursework involves computer science software and hardware, mathematics and the natural sciences, leaving time and flexibility to explore your specific interests. Imagine yourself in elective courses such as:
Computer Organization
Embedded Systems
Programming Language Concepts
Software Engineering
Operating Systems Principles
Database Systems
High-performance Computing
', 'In the College of Engineering, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in computer science such as:
Studying abroad at Tampere University of Technology in Finland
Serving as the Game Developers Club president
Interning with Hudl in data science
Researching how drones are used for close observation of wildfires
Volunteering in public schools with Computing for All
', 'A major in computer science at Nebraska means preparing for one of the fastest growing and well paying fields in the nation! Computer science graduates readily find employment as internet programmers, web information retrieval systems designers, game and animation programmers, scientific programmers, high-speed processor specialists, electronic commerce specialists and engineers of enterprise-scale software systems. Here are examples of recent graduates'' employment:
Business Technology Support Technician / DEPARTMENT OF ROADS
Data Engineer / HUDL
GIS Web Developer, Analyst / THE NORTH JACKSON COMPANY
Mobile App Developer / SANDHILLS PUBLISHING
Officer / UNITED STATES AIR FORCE
Programmer / NEBRASKA HEART HOSPITAL
Software Consultant / SELF EMPLOYED
Software Developer / EXPERIAN
Systems Application Specialist / SANDHILLS PUBLISHING
Technology Specialist / TD AMERITRADE
', 10),
(19, 'Construction Management', 'College of Engineering', 'Professionals in construction management make up the most diversified industry in the nation. As constructors, these individuals provide leadership for managing, coordinating, and supervising the construction processes during the concept development, design, and construction and facility management stages. Students will spend time at a building site as well as managing the contracts, execution of the building plans, and quality assurance. As part of the college''s Durham School of Architectural Engineering and Construction, students will also enjoy innovative research and hands-on opportunities outside the classroom. There is a high demand for UNL graduates in this area.', 'Student''s work can lead to such areas as highway/heavy construction; construction finance, marketing, management, or design/development; or mechanical/electrical or residential construction.Recent employers include Black & Veatch, Hawkins Construction, Hardrock Concrete Placement Co. Inc., Johnson Controls, Lusardi Construction, Peter Kiewit & Sons, Oakview Construction, The Weitz Co., Western Construction Group, and Waldinger.', 'Students can work with faculty on such projects as the DOE Building America Program to help improve the energy efficiency of American homes. UNL is one of the only 15 research teams across the nation selected by the U.S. Department of Energy. Students also benefit from industry professionals who teach at the school.', 10),
(20, 'Criminology and Criminal Justice', 'College of Public Affairs and Community Service', 'The School of Criminology and Criminal Justice is committed to educating students for challenging careers in the criminal justice system.Courses offered by the school are designed to provide a comprehensive knowledge of criminology and the criminal justice system and focus on:
	courts and law
	law enforcement
	corrections
	criminal behavior
	other contemporary criminal justice topics
Faculty have received widespread recognition for their teaching and research in the profession and challenge students to develop an in-depth understanding of the criminal justice system, contemporary criminal justice issues and critical reasoning skills needed by future criminal justice professionals.', 'Graduates from the program have gone on to successful careers as:
	prosecutors
	judges
	defense attorneys
	chiefs of police
	directors of criminal justice agencies
	federal agents
	law enforcement officers and investigators
	correctional caseworkers and administrators
	probation and parole officers
	juvenile justice officials
	researchers and professors
	as well as other positions
Many career opportunities are listed below but graduates are not limited to:
	Corrections

	Correctional Caseworker
	Parole Officer
	Correctional Administrator
	Warden

	Courts and Law

	Attorney
	Court Administrator
	Probation Officer
	Pretrial Services Officer

	Juvenile Services

	Child Protective Services Worker
	Group Home Worker
	Juvenile Care Specialist
	Juvenile Diversion Coordinator
	Juvenile Services Administrator

	Law Enforcement

	Deputy Sheriff
	Federal Agent
	Police Chief
	Police Investigator
	Police Officer
	Sheriff

	Private Security/Investigation

	Fraud Investigator
	Loss Prevention Specialist
	Private Investigator
	Security Administrator/Manager

	Regulatory Agency Investigator

	Child Support Enforcement Officer
	Fire Marshall
	Investigator for a Federal Agency

	Research

	Criminologist
	Legislative Assistant
	Research Analyst
	Research and Planning Specialist

	Victim''s Services

	Crisis Center Coordinator/Counselor
	Domestic Violence Advocate
	Victim Services Coordinator
', 'Research activity within the school focuses on a wide variety of current issues in criminology and criminal justice.The school supports the Juvenile Justice Institute and the Consortium for Crime and Justice Research which work collaboratively with government and nonprofit agencies across the state on crime and justice issues.', 10),
(21, 'Dance', 'Hixson-Lied College of Fine and Performing Arts', 'Students receive training through the advanced level of modern dance technique and additionally take 2-3 semesters of dance composition as well as study in:
dance history
dance pedagogy
dance kinesiology
music
Each year students have many opportunities to perform on- and off-campus, including at the American College Dance Festival regional conferences, on a semi-annual tour though the northeast and at other venues.Students have the opportunity to teach modern dance in local high schools, at after-school programs for high-risk youth and at other outreach programs.Students have also had the opportunity to perform with internationally known dance companies through short- and long-term residencies, including:
Troika Ranch
Diavolo
AXIS
Heidi Latsky Dance Company''s - Gimp Project
', 'Since this major focuses on the specific skills required to learn, retain, and perform dance, students who earn this degree are very marketable in dance-related professions.In recent years, students have joined dance companies, including Xenon Dance in Minneapolis and Cleo Parker Robinson in Denver.In fact, upon graduation, increasing numbers of dance students are gravitating towards performance careers, more so than in the past.Several have started their own dance studios while others have become leaders at existing studios.', 'Classes are held in our huge, dedicated space with occasional classes also taking place at the local performing arts center''s black box theatre.', 10),
(22, 'Economics', 'College of Business', 'Economics students of today are versatile thinkers and problem-solvers who will provide leadership in the 21st century. Economics majors gain advanced knowledge in economic reasoning and apply their analytic ability to major issues confronting the nation and the global community of nations.Economics students can look forward to careers in banking, insurance, brokerage, financial services, corporate consulting and government. Students planning to enter professional and graduate programs, particularly in law, foreign service, labor relations or business administration also chose to major in economics.Majoring in economics is the key to a great job in any industry. When you graduate from the College of Business you will not only be qualified to find a good job straight out of school, you will also have the skills and talents you will need to succeed in future graduate work, whether it be a Ph.D. in economics, an MBA or a juris doctorate. Most importantly, you will develop analytical skills that give you the ability to understand the world around you and lead a rich and active life regardless of the path your future takes.', 'Economics allows for a variety of career opportunities in many different types of organizations. Recent UNL economics graduates are employed full-time at the following companies, just to name a few:
Ameritas
Cerner
ConAgra
Gemini Fund Services
Kiewit
Milliman Inc.
Mutual of Omaha
National Indemnity Company
Northwestern Mutual
Sandhills Publishing
Trade Explorer
Union Pacific Railroad
', 'Our active research faculty members have been published in several top tier journals including Economic Inquiry, National Tax Journal, Southern Economic Journal, American Economic Review, Journal of Regional Science, journal of Economic Education.In addition, faculty members are constantly publishing in refereed journals throughout the year including: Journal of Forensic Economics, Journal of Public Economic Theory, Journal of Consumer Education, Contemporary Economic Policy, journal of Economic Issues, International Tax and Public Finance, Feminist Economics, Journal of Public Policy & Marketing, International Regional Science Review, and International Journal of Economics.Faculty at the National Center for Research in Economic Education Edit the Journal of Economic Education. Faculty also have published textbooks, books and book chapters on wide ranging topics from Economic Education, Entrepreneurship, Feminist Economics, International Economics, International Finance, the Economics of Immigration, Policy Analysis, and Taxation.', 10),
(23, 'Electrical Engineering', 'College of Engineering', 'Electrical engineers enjoy dynamic and extremely varied career opportunities. They work with signals at frequencies from zero to beyond the optical range, and they use such tools as computers, advanced mathematics, and wire cutters. They design new machines and improve existing ones; work with computer-related electronics and communication systems; create navigation, robotics and guidance systems for rockets, missiles, spacecrafts and toys; design satellite and optical communications; and help discover and utilize new energy sources. Our students attend national and international competitions in such areas as wind energy and IEEE conferences.', 'Our Electrical Engineering B.S. degree can lead you to careers in a growing industry. The degree also enables you to pursue advanced degrees in medicine, biomedical, and law. Career areas include aerospace, bioengineering, computers, renewable energy and electric power, telecommunications, transportation, semiconductors, and other professions.Recent employers include Boeing Company, Garmin International, National Instruments, ST Microelectronics, Intel, Halliburton, Microsoft Corp., General Dynamics, Black & Veatch, Nebraska Public Power District - Cooper Nuclear Station, and Danfoss Industries.', 'Our faculty conduct research related to electronic materials, nano-technology, optical systems, communications, biomedical applications, signal processing, microelectronics design, energy systems, and electromagnetics, and work closely with undergraduate and graduate students in their research.', 10),
(24, 'English', 'College of Arts and Sciences', 'As an English major, you will not only study literature but also engage with history, popular culture, digital media and film. You''ll explore texts imaginatively and study genre and craft in order to write novels, essays, poetry, memoirs or film scripts. You might engage with these texts for the purpose of social critique to discover the ways culture impacts your understanding of yourself and others so that you can motivate social and political change.Join one of the most eclectic and diverse English departments in the Big Ten where you can select from a number of interdisciplinary areas like:
Medieval and Renaissance Studies
Ethnic Studies
Digital Humanities
American Literature
British Literature
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in English such as:
Studying abroad at Oxford to learn about Shakespeare''s Dramatic Arts
Serving as the English Club president
Interning with University of Nebraska Press
Researching Willa Cather in the Center for Digital Research in the Humanities
Volunteering with Nebraska Writer''s Collective
Nebraska is home to the Center for Digital Research in the Humanities, where you could have the opportunity to work with faculty and create research sites and tools that push our understanding of history, literatures, languages and culture.', 'We encourage you to match intellectual interests with a meaningful career path. Take our orientation course on "Career Planning for English Majors" as well as other worthwhile, career-focused courses in editing and publishing and digital humanities. Let us take you "from words to worlds," with career planning that goes beyond individual course assignments to include internships and other occupational experiences making your undergraduate experience enjoyable and you employable. Here are examples of recent graduates'' employment:
Assistant Director of Business / NEBRASKA ALUMNI ASSOCIATION
Assistant Literary Agent / EMMA SWEENY AGENCY
Digital Archivist Photo Librarian / NEBRASKA GAME AND PARKS COMMISSION
English Teacher / PEACE CORPS
Grant Writer / LIED CENTER FOR PERFORMING ARTS
Junior Coach / COLLEGE POSSIBLE
Managing Editorial Assistant / CROWN PUBLISHING, PENGUIN RANDOM HOUSE
Paralegal / BROWN IMMIGRATION LAW
Quality Analysis Associate / CARLON UNLIMITED
Teaching Artist / NEBRASKA WRITERS COLLECTIVE
', 10),
(25, 'Environmental Science', 'College of Agricultural Sciences and Natural Resources', 'The environmental science major will provide you with the skills and knowledge for recovering ecosystems and solving complex environmental problems. This major is perfect for students passionate about the environment, natural resource management or the outdoors. You will receive a variety of classroom and field experiences to help you develop the skills needed to become an environmental scientist.All students majoring in environmental science will choose between the social science or lake and stream restoration programs. You will gain a thorough understanding of the soil-water environment, environmental regulations, toxicology, environmental sampling and restoration techniques.Because environmental problems are complex, environmental scientists will often work with interdisciplinary teams to find solutions. Many environmental consulting firms and government agencies commonly employ both scientists and engineers to work hand-in-hand on various projects (soil, surface water, groundwater and habitat).', 'Environmental scientists are individuals who measure and observe air, water and soil to identify sources of pollutants and recommend the best ways to clean and preserve the environment. The job market for environmental scientists is continuously growing, with opportunities in the following areas:
U.S. Environmental Protection Agency
Bureau of Land Management
U.S. Department of Agriculture
Department of Environmental Control
U.S. Natural Resources Conservation Service (formerly U.S. Soil Conservation Service)
Nebraska Natural Resources Commission
', 'The School of Natural Resources is located in Hardin Hall, a state-of-the-art facility located on the University of Nebraska–Lincoln''s East Campus. The complex houses three lecture rooms, two teaching laboratories, three teaching computer labs, a student services center and numerous research labs. The environmental science program also has research laboratory space in Kiesselbach Crop Research Laboratory.', 10),
(26, 'Finance', 'College of Business', 'Students will learn to apply the principles and techniques of time value of money, quantify and interpret risk/reward relationships using a variety of metrics, estimate the fundamental value of traded and non-traded assets, identify resources of risk and implement appropriate risk management techniques and analyze market conditions for strategic planning.', 'Career opportunities associated with the finance major include corporate finance, commercial banking, risk management and insurance, wealth management and portfolio management, and financial analyst.', 'The undergraduate program in finance is ranked by Bloomberg Businessweek as 40th nationally and third in the Big Ten.The department is a Program Partner With CFA Institute and offers an Investments/CFA track in the undergraduate major. Specializations are also available in Banking and Risk Management and General Finance.', 10),
(27, 'Fisheries and Wildlife', 'College of Agricultural Sciences and Natural Resources', 'Fisheries and wildlife professionals are responsible for the conservation, protection, regulation, and management of our nation''s fish and wildlife resources. Their management strategies provide for both consumptive (hunting, fishing) and non-consumptive uses (bird watching, non-game species enhancement, threatened and endangered species protection, and others). Students in the Fisheries and Wildlife major receive hands-on training with active demonstrations, problem-based exercises, community-based service learning opportunities, and experiential learning.Students who successfully fulfill the requirements in the fisheries and wildlife major are prepared to enter their field as well as postgraduate programs. The curriculum reflects minimal civil service requirements of the federal government for wildlife and fisheries biologists and incorporates course requirements for certification in professional societies. The breadth of the curriculum prepares graduates to address complex environmental issues and interact professionally with a multitude of natural resources disciplines to develop solutions to problems. Typical careers for graduates of this major include fisheries or wildlife biologists with private consulting firms and zoos, as well as governmental resource management agencies at the local, state, federal, or international level.', '
Fisheries research and management
Wildlife research and management
Wildlife damage management
City planning and policy
Refuge management
Geospatial information services
Marine biology
Endangered species management
Private lands habitat management
Conservation
Water quality
Park ranger
Environmental education
Zoo keeping
', 'The College of Agricultural Sciences and Natural Resources is located in Hardin Hall, a state-of-the-art facility located on the University of Nebraska–Lincoln''s East Campus. The complex houses three lecture rooms, two teaching laboratories, three teaching computer labs, a student services center and numerous research labs.', 10),
(28, 'Food Science and Technology', 'College of Agricultural Sciences and Natural Resources', 'The food science and technology curriculum includes a balance of courses in food science, biological sciences, physical sciences, mathematics, social sciences and humanities. Food science courses include food processing, food engineering, food analysis, food chemistry, food microbiology, nutrition, quality assurance, and commodity processing. The program is designed to allow students to develop an area of emphasis that fits their career goals by providing technical elective hours. Students may participate in an internship program that provides summer employment in the food industry.', 'Food science and technology majors find career opportunities with food processing firms, government agencies and educational institutions. Positions available to food science and technology graduates include:
Product development
Quality assurance
Food plant management
Food research
Food marketing and sales
Education and extension
Medicine
Pharmacy
', 'Our facilities contain modern, state-of-the-art equipment. We have dedicated professors who have received college-wide and national awards for excellence in teaching and research. There are established funds available for scholarships and unique opportunities for internships and undergraduate research. Nebraska''s Food Science program is well-known for its many research accomplishments, and we are internationally recognized for our research on food safety, food chemistry and food engineering.', 10),
(29, 'Forensic Science', 'College of Agricultural Sciences and Natural Resources', 'A bachelor''s degree in forensic science from the University of Nebraska–Lincoln is a great way to transform your passion for science and discovery into a career with a very real and meaningful impact on society.There are three forensic science specializations:
Crime Scene Investigation (CSI) – Prepare to collect, preserve and interpret physical evidence using standard crime scene investigation and evidence analysis techniques.
Forensic Biology – Prepare to work in a laboratory setting. Identify and analyze a wide range of biological evidence including DNA and body fluids, such as blood and saliva.
Forensic Chemistry - Prepare to work with techniques used for chemical analysis of forensically important materials and non-biological evidence.
', '
Crime Scene Investigator
DNA Analyst
Criminalistics Specialist
Medical Examiner
Police Officer
Lawyer
Medical Doctor
Forensic Nurse
Forensic Dentist
Forensic Chemist
Forensic Anthropologist
', 'The University of Nebraska–Lincoln is one of only two forensic science undergraduate programs in the Big Ten.', 10),
(30, 'Geology', 'College of Arts and Sciences', 'A major in geology will move you to a broad range of study, encompassing a blend of the physical and biological sciences but adding the fourth dimension of geologic time. You will engage in a field- and laboratory-oriented program of study that exposes you to the full spectrum of geological experiences. Research projects will carry you around the world to remote localities in Antarctica, Australia, South America, Canada, Europe and all of the world''s oceans.Introductory courses are Physical Geology, focused on Earth''s structure, composition, and the physical processes that shape the Earth; and Historical Geology, which treats the evolution of Earth and life from their origins to the present. Higher-level courses emphasize:
mineralogy
geochemistry
rock origins
Earth structure
geophysics
All of these courses prepare you for a six-week summer field course.', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in geology such as:
Studying abroad in Ireland to learn about Economic & Exploration Geology
Serving as the Geology Club president
Interning with the United States Geological Survey
Researching the paleokarst surfaces within the Persian Gulf
Volunteering at Morrill Hall
', 'The employment outlook in geology is excellent, especially in petroleum geology and environmental geology. Several topical issues present challenges—and employment opportunities—for geologists, including decreasing energy, mineral and water resources; increasing concerns about protecting the environment; climate change and its effect on sea level, coastal erosion and flooding; and predicting and mitigating natural hazards such as earthquakes, tsunamis, volcanic eruptions and landslides. Here are examples of recent graduates'' employment:
Drafter / BOOZ ALLEN HAMILTON
Geologist / FULBRIGHT
Geologist / MARATHON OIL COMPANY
Geotechnician / WHITING PETROLEUM CORPORATION
Hydrogeologist / UNITED STATES GEOLOGIC SURVEY
Library Service Associate / CITY OF LINCOLN - LIBRARY DEPARTMENT
Mud-logger / SELMAN AND ASSOCIATES
Quality Assurance Departures Specifications / EPSILON SYSTEMS SOLUTIONS
Researcher / UNIVERSITY OF NEBRASKA-LINCOLN
', 10),
(31, 'Graphic Design', 'Hixson-Lied College of Fine and Performing Arts', 'The University of Nebraska''s Design program teaches students to critically investigate the world, conscientiously engage in change, and design creative, impactful communication systems while becoming passionate life-long design thinkers.The School of Art, Art History & Design is accredited by the National Association of Schools of Art & Design (NASAD). We are the only NASAD accredited institution in the state to offer a BFA or BA in Graphic Design.At the heart of Graphic Design is effective communication: while developing a personal aesthetic and design values, students also learn to form cohesive ideas, write design briefs, prepare mechanicals, and learn how to professionally present work. We strive to instill in students the leadership skills that are invaluable to clients and employers. Our program prepares students to enter the dynamic and expanding array of design professions.', '
Branding and Identity
Product Package Design
Mobile Application Design
Environmental Graphics and Signage
Information Design & Data Visualization
Interactive Media & Web Design
Editorial & Publication Design
Advertising Design
Sustainable & Green Design
Fashion & Retail Design
Design for Social Change
', 'The graphic design facilities include:
Woods Art Building
', 10),
(32, 'History', 'College of Arts and Sciences', 'Studying the past while preparing for the future is what you can expect when majoring in history at Nebraska. You will gain a global perspective as well as the knowledge, skills and experience to understand our history while developing a critical understanding of how the past continues to shape the present and future. Learn from faculty who specialize in the United States, Latin America, South America, the Middle East, Europe, Russia, China and Africa—from ancient civilizations to modern history.Core classes in the major teach you the fundamentals of historical research and analysis and cover major themes and events in U.S., European and World History with special courses in Latin American, Asian and African history. In addition, you can elect to enroll in courses such as:
Slavery and Emancipation
19th Century America
United States Military History
Women in European History
The Holocaust
Ancient Rome
Medieval Culture
Digital History
History of Espionage and many more!
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in history such as:
Studying abroad in South Africa
Serving as the History Club president
Interning with the Supreme Court of the United States
Doing research on decolonization and the modern world
Volunteering with History Harvest
', 'As a history major, you will receive training in those skills—careful research, critical analysis and cogent writing—that make you an attractive candidate for a wide range of career opportunities. You will be equipped for pursuing a career in law, journalism, education, library and museum work; in local, state and national government; and in business, where a knowledge of domestic and foreign affairs is particularly useful. Here are examples of recent graduates'' employment:
Assistant Scheduler / US SENATE
Chief of Interpretation (Park Ranger) / NATIONAL PARK SERVICE
Editor / THE WASHINGTON INFORMER NEWSPAPER
Editorial Assistant / UNIVERSITY OF NEBRASKA PRESS
ESL Teacher / EDUCATION FIRST
High School Spanish Teacher / TEACH FOR AMERICA
Highway Archaeologist/Curator of Anthropology / NEBRASKA STATE HISTORICAL SOCIETY
Human Resources Director / MID-PLAINS CENTER FOR BEHAVIORAL HEALTHCARE
Immigration Services Officer / UNITED STATES CITIZENSHIP IMMIGRATION SERVICES
Record Clerk / LANCASTER COUNTY COURTHOUSE
', 10),
(33, 'Hospitality, Restaurant and Tourism Management', 'College of Education and Human Sciences', 'The Bachelor of Arts in Hospitality, Restaurant & Tourism Management is jointly offered by the College of Education & Human Sciences and the College of Agricultural Sciences and Natural Resources. The degree prepares individuals to serve as general managers and directors of hospitality operations by providing an excellent foundation in hospitality, leadership, and business. The program integrates hospitality marketing strategies, communications, and financial management into a curriculum focused on managing facilities and operations that provide hospitality services to the public. Students take HRTM core required courses then select professional courses which include advanced courses in Food & Beverage; Lodging; Event Planning; Tourism/Public Relations; and Human Resources. All students will receive a minor in Leadership & Communication offered by the Department of Agricultural Leadership, Education and Communication. Students may also complete a minor in business with a few additional classes.', 'Career opportunities associated with this degree include positions such as Meeting Planner, Private Club Manager, Banquet and Events Coordinator, Wedding Planner, Marketing Manager/Director, Hotel/Resort General Manager, Concierge, Entrepreneur, Catering Manager/Owner/Director, Food & Equipment Distributor, Convention and Visitors Bureau Manager, Food and Beverage General Manager/Regional Manager/Director, Conference/Tradeshow Manager, Public Relations Coordinator, Restaurant Manager, Contract Food Service Manager/Director, Human Resources Manager/Director, Tourism Specialist/Manager/Director, Travel Consultant.', 'We have specialized laboratories for food preparation and sensory analysis of food and a computer lab.', 10),
(34, 'Journalism', 'College of Journalism and Mass Communications', 'From day one, you will have hands-on opportunities to hone your skills as a storyteller. You will learn to create stories in words and images, how to use social media to report and how to produce multimedia stories.Journalists keep the public informed by offering a window to the world through the stories they tell. As a journalism major, you will learn how to gather and organize information, produce photography and videography that can be displayed in a variety of media and the importance of free expression in a democratic society and the media''s role in fostering that freedom.You can get involved with special opportunities, such as:
Global Eyewitness, travel to photograph international and domestic places of great human need
Nebraska News Service, report on the Nebraska Capitol
Omaha World-Herald Fellowship program, work at the newspaper for a semester while taking classes
Mosaic, report on the growing refugee and immigrant community in Nebraska
Hearst Journalism Awards competition
Dow Jones News Fund editing program
', 'A degree in journalism can take you anywhere you dream of going. The College of Journalism and Mass Communications has the highest job placement rate at UNL, and our graduates have found careers worldwide.Our graduates are employed at major daily newspapers and top media organizations. Some of the places our graduates find employment include:
The New York Times
Chicago Tribune
Associated Press
Slate
Variety
Washington Post
Wall Street Journal
BuzzFeed
Time
Fast Company
If you choose not to work for the media, you will also be well equipped for graduate and law school or the kinds of career opportunities that require excellent writing and communication skills.According to a national accreditation report, our program prepares journalism students to "be challenged, have significant multimedia experience, and have every opportunity to be prepared for the constantly changing world of news media and communications."', 'Our faculty and students are passionate about what they do and their research and creative activity reflects that through a variety of media - print, web, audio, photography, videos and documentaries.The college has a long history of producing award-winning depth reporting projects that have covered a variety of topics, including:
Cuba after 50 years of communist rule.
The relationship between France and the U.S.
Immigration in the state of Nebraska.
Self-rule in Bolivia.
The impact of Native American women on their society.
The birth of a nation in Kosovo.
Our student''s work in the innovative News21 program has appeared prominently in many national publications, including:
The Washington Post
MSNBC.com
The New York Times
San Francisco Chronicle
Faculty members have also created both popular and scholarly work. Some examples:
Professor John Bender''s reporting textbook is in its 10th editioqn.
Professor Joseph Starita''s book on a Native American family was nominated for a Pulitzer Prize.
Professor Bernard McCoy''s 2 award-winning documentaries have been televised in several major markets and screened at several film festivals.
', 10),
(35, 'Marketing', 'College of Business', 'This major prepares students for career opportunities in marketing. Students can choose from a wide variety of courses that expose them to different aspects of marketing including, consumer behavior, market research, marketing communications, international marketing, services marketing, retailing, sports marketing, managing channels of distribution, professional selling, and sales force management. In addition, students have the opportunity to take an experiential learning class, in which they work with an actual organization to develop solutions for its marketing problems.', 'Careers associated with Marketing include such positions and opportunities as Marketing Communications, Sales Management, Product and Brand Management, Marketing Research, Managing Channels of Distribution, Retailing, Services Marketing, Global Marketing, Sports Marketing, Entertainment Marketing, Non-Profit and Social Marketing, Healthcare Marketing, Tourism and Hospitality Marketing or e-Marketing.', 'Notable organizations include the UNL AMA Collegiate Chapter.', 10),
(36, 'Mathematics', 'College of Arts and Sciences', 'When you major in mathematics at Nebraska, you will study the areas of pure and applied mathematics and statistics. In addition to the core requirements of a calculus series and set of advanced mathematics courses, you can select one of four options:
concentration
education
research experience
statistics
You can select from electives such as Introduction to Modern Algebra, Advanced Calculus, Elementary Analysis, Topics in Contemporary Mathematics, Discrete and Finite Mathematics, Theory of Linear Transformations, Introduction to Complex Variable Theory, Math in the City and many more!', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in mathematics such as:
Studying abroad in Santiago, Chile
Serving as the Math Club president
Interning with ConAgra Foods or Birkshire Hathaway Homestate
Researching with the National Security Agency (NSA)
Volunteering with the Center for Civic Engagement Tax Preparation
', 'As a math major, your skills in logic and problem solving will be valuable in a variety of professions. In fact, the top 15 highest-earning college degrees have one thing in common—math skills. Here are examples of recent graduates'' employment:
Actuary / CNA INSURANCE
Business Analyst / SANDHILLS PUBLISHING
Data Engineer / HUDL
Implementation Consultant / FAST ENTERPRISES
Math Teacher / OMAHA PUBLIC SCHOOLS
Programmer/Analyst / CENTRIX SOLUTIONS, INC.
Quality Assurance Analyst / NANONATION
Social Insurance Specialist / SOCIAL SECURITY
Statistical Analyst / EXPERIAN
Website Production Support / CABELA''S
', 10),
(37, 'Mechanical Engineering', 'College of Engineering', 'Mechanical engineers are considered the "general practitioners" of engineering because they solve a diverse range of problems. At UNL, students will choose among three major areas: thermal-fluid science engineering, systems and design engineering, and materials science engineering. Students will be able to practice what they learn in the classroom by joining clubs like the HUSKER racing team that designs and competes in contests like the national Baja race or NASA''s Microgravity University (where UNL teams are chosen to help with NASA research in a zero gravity environment). Students also have numerous interactions with local industry for senior design projects. Companies provide projects for students, providing them real-life engineering problems and access to potential employers.', 'After earning a degree, careers could take you into research and development, design of equipment and systems, testing, plant and sales engineering, and management. Jobs include serving as a Quality Assurance Officer, Project Engineer, Systems Engineer, Mechatronics Engineer, Materials Analyst, Combustion Technician, Aerodynamics Researcher, New Product Developer, Instrumentation Designer, and Control Systems Specialist.Recent employers include:
Union Pacific Railroad
Hamilton-Sundstrand
OPPD
Kellogg''s
Pella
', 'Students have many opportunities for out-of-class experiences. For example, the annual Formula Society of Automotive Engineers competition moves to Lincoln in 2012. For FSAE, teams of students design and build a Formula-style car to compete with other universities from around the nation. UNL mechanical engineering students are leading the team preparing Nebraska''s first entry in the competition.', 10),
(38, 'Meteorology and Climatology', 'College of Arts and Sciences', 'A major in meteorology-climatology opens the door to your future career in the exciting and ever-changing world of weather and climate. This major is comprehensive, but flexible so that you can pursue you own interests within the broad field of atmospheric sciences, while meeting the federal government requirements for employment as a meteorologist.You will build a solid foundation in meteorology-climatology with core courses that combine basic atmospheric science with training in mathematics, computer science and physics. You will apply this knowledge as you learn analytical problem-solving and forecasting techniques, methods for atmospheric measurements and how the atmosphere interacts with other components of the earth system. Choose from elective courses in:
Severe Storms
Air Pollution
Tropical Meteorology
Global Climate Change
Remote Sensing of the Atmosphere
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in meteorology and climatology such as:
Serving as the university''s American Meteorological Society president
Interning with Planetary Data, Inc.
Taking a field trip to the National Severe Storm Lab in Oklahoma
Researching climate change resilience in developing nations
Volunteering with the Emergency Management Office
OpportunitiesWith a major in meteorology-climatology you will be prepared for employment with federal agencies such as the National Weather Service, National Aeronautics and Space Administration, Environmental Protection Agency, National Park Service and military. You can also work in private weather consulting; broadcast meteorology; and the agriculture, education and energy sectors. Here are examples of recent graduates'' employment:
Broadcast Journalism Intern / FLOOD COMMUNICATIONS / NEWS CHANNEL NEBRASKA
Coding Specialist / NATIONAL RESEARCH CORPORATION
Extension Educator / UNIVERSITY OF NEBRASKA-LINCOLN
Meteorologist Intern / NATIONAL WEATHER SERVICE
Meteorologist / NEBRASKA DEPARTMENT OF ROADS
Photo Journalist / CHANNEL 8 EYEWITNESS NEWS
Pilot / UNITED STATES AIR FORCE
Research Associate / HIGH PLAINS REGIONAL CLIMATE CENTER
Underwriting Assistant / NATIONAL INDEMNITY
Weekend Meteorologist / Reporter / KNOP-TV
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in meteorology and climatology such as:
Serving as the university''s American Meteorological Society president
Interning with Planetary Data, Inc.
Taking a field trip to the National Severe Storm Lab in Oklahoma
Researching climate change resilience in developing nations
Volunteering with the Emergency Management Office
OpportunitiesWith a major in meteorology-climatology you will be prepared for employment with federal agencies such as the National Weather Service, National Aeronautics and Space Administration, Environmental Protection Agency, National Park Service and military. You can also work in private weather consulting; broadcast meteorology; and the agriculture, education and energy sectors. Here are examples of recent graduates'' employment:
Broadcast Journalism Intern / FLOOD COMMUNICATIONS / NEWS CHANNEL NEBRASKA
Coding Specialist / NATIONAL RESEARCH CORPORATION
Extension Educator / UNIVERSITY OF NEBRASKA-LINCOLN
Meteorologist Intern / NATIONAL WEATHER SERVICE
Meteorologist / NEBRASKA DEPARTMENT OF ROADS
Photo Journalist / CHANNEL 8 EYEWITNESS NEWS
Pilot / UNITED STATES AIR FORCE
Research Associate / HIGH PLAINS REGIONAL CLIMATE CENTER
Underwriting Assistant / NATIONAL INDEMNITY
Weekend Meteorologist / Reporter / KNOP-TV
', 10),
(39, 'Music', 'Hixson-Lied College of Fine and Performing Arts', 'As a music major, you have 2 degree options that share a common 3-year core curriculum:
Bachelor of Arts
Bachelor of Music
Building on that base, your career goals will determine the appropriate degree option.Bachelor of Music Degree (BM)This degree includes performance, composition, music theory, and music history, all of which require additional coursework designed to prepare you for a career as a professional musician.Bachelor of Arts in Music (BA)This degree adds a minor or second major to the shared core.Recipients of both degrees are prepared for graduate study in music.
The performance major is recommended for students who have the desire and capability to reach high standards of achievement through performance in voice or on an instrument.
Students with creative talent may elect to develop their abilities as composition majors.
Students who want to increase their understanding of the history and/or theory of music may become music history or music theory majors. 
Music majors may also be attracted to one of our popular minors in music technology and musical theatre.
In addition, the Glenn Korff School of Music provides outstanding opportunities for every university student to pursue a love of music in courses such as the history of popular, jazz, rock, and film music; and participation in any of our ensembles (by audition), including the world-famous Cornhusker Marching Band.Program OpportunitiesOur 3-3 Law Program also allows you to complete your music degree through the College of Law:
complete 3 years in your undergraduate major
complete your 4th year through the College of Law
complete 2 additional years as a graduate student in the College of Law
receive your bachelor''s degree and Juris Doctor degree in 6 years, rather than the traditional 7 years
', 'Careers are possible in many fields, including:
Professional Performer
Composer
Arranger
Church Musician
Music Publisher
Music Scholar
Music Librarian
Music Manager
Music Technologist
Music Retailing & Merchandising
Music Critic
Journalist
Broadcasting and Announcing
Recording Engineer
Music Instrument Technician
Post-Secondary teaching
Public and Private K-12 Teaching
Private Home Studio Teaching
', 'The Glenn Korff School of Music boasts facilities that enable music students to pursue diverse areas of study in an effective manner.The performance complex includes the university''s Lied Center for Performing Arts. It holds a capacity of 2,200, has stage dimensions sufficient for major touring production, and has hosted such artists as:
Isaac Stern
Itzhak Perlman
Midori
Joshua Bell
Yo-Yo Ma
In addition, the complex includes 2 halls managed by the school of music:
The 850-seat Kimball Recital Hall with the Miskell Memorial Organ
Westbrook Recital Hall, housing several concert instruments
The Music Library housed in Westbrook Music Building is one of the midwest''s major music collections. It holds approximately 45,000 books, scores and periodicals, and over 17,000 sound recordings. Music majors receive training in the new Music Technology Center.Practice facilities of the Glenn Korff School of Music are among the best in the nation.More than 120 pianos are meticulously tuned and maintained by a full-time piano technician. Piano majors have access to soundproof rooms equipped with:
a large selection of grand pianos
several harpsichords
a forte-piano
a clavichord
a virginal
', 10),
(40, 'Nutrition & Health Sciences', 'College of Education and Human Sciences', 'The Nutrition and Health Sciences department helps develop students into the next wave of leaders in health and wellbeing professions. Our programs prepare students to enter health schools and professions where they can make a difference in the lives of others. Through our hands-on research and laboratory experiences in multiple nutrition exercise, and health areas, students are given tangible skills that will help them succeed in future. These programs provide students with an curriculum that will develop their understanding of human sciences through a nutrition lens. Our flexible programs provide students the ability to add minors while also completing the pre-requisites for any graduate health program.Nutrition and Health Science Options:Community Health and WellnessNutrition, Exercise and Health ScienceNutrition Science', 'Graduates from our Nutrition and Health Science Programs are prepared to serve others in a variety of professions. Commonly, we see students enter into graduate health programs such as Physical Therapy, Athletic Training, Occupational Therapy, Public Health, Registered Dietitian, Physicians Assistant, Nursing, Chiropractor, Pharmacist, Dentist, and Medical Physician. If not graduate school, then students have found success in professions such as Public Health Educator, Corporate Wellness Manager, Strength and Conditioning Coaching, Research Scientist, and Personal Training.', '
Concetta DiRusso - Neutrogenomist
Janos Zemplini - Molecular Nutrition
Julie Albrecht - Extension Food Specialist working worldwide on issues of food safety
Sathish Natarajan- Cytoprotection
', 10),
(41, 'Philosophy', 'College of Arts and Sciences', 'A major in philosophy will move you to study difficult and fundamental problems and get acquainted with the major issues in a broad range of philosophical areas; be capable of logical analysis; critically explain complicated philosophical texts; write clear, coherent, plausible, argumentative essays; and reason philosophically.The courses in your major cover areas of Western philosophy. Ethics courses cover both applied ethics (what ethics requires in particular types of cases) and theoretical ethics. Social-political philosophy investigates similar questions about social structures. Metaphysics deals with the fundamental nature of the world and reality. The theory of knowledge investigates the nature, scope and limits of human knowledge. Logic studies inferences. History of philosophy courses examine how people have answered philosophical questions in the past. Aesthetics looks at the nature of art. Philosophy of science explores the practice and justification of science. And philosophy of religion addresses the nature and justification of religion.', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in philosophy such as:
Studying abroad in Athens, Greece
Joining a Philosophy Reading Group
Interning with the Nebraska Department of Economic Development
Researching the impact of religious philosophy on politics
Volunteering for the Center for People in Need
', 'Philosophy prepares you especially well for careers requiring analysis, decision making and communication. People graduating with philosophy degrees work in many different occupations, including computer programming, business consulting, management, government, policy analysis, editing, law and medicine. Undergraduate philosophy majors characteristically do very well on entrance exams for graduate and professional schools. Here are examples of recent graduates'' employment:
Administrative Assistant / NEBRASKA
Assistant Account Manager / FACTS MANAGEMENT
Commercial Customer Service Representative / DAKTRONICS
Crop Consultant / MALMSTROM AGRONOMICS
Data Scientist / CONTEMPORARY ANALYSIS
Direct Support Professional / DEVELOPMENTAL SERVICES OF NEBRASKA
Library Service Associate / CITY OF LINCOLN - LIBRARY DEPARTMENT
Personal Banker / UNION BANK TRUST
Strategic Analyst / BRABENDERCOX
', 10),
(42, 'Physics', 'College of Arts and Sciences', 'As a physics major at Nebraska, you will study matter and energy and their interactions. Physics is not just a body of knowledge—it is a set of approaches that will allow you to solve all kinds of problems. Physics seeks to describe the most basic features of a system and the underlying general rules that govern them. These rules are powerful tools for understanding that system and similar ones that you may encounter later.The core curriculum includes courses in physics, math and chemistry as well as four options to choose from based on your interest, including:
a professional option for graduate study or employment in physics or a related scientific or engineering discipline
an optics and lasers option
an option in materials physics
one in computational physics
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in women''s and gender studies such as:
Studying abroad in Iceland to learn about renewable energy and sustainability
Serving as the UNL Society of Physics Students president
Interning with Holland Computing
Researching optics and laser physics
Volunteering with the Holmes Lake Observatory
', 'Because the study of physics develops such strong analytical skills, physicists go into a wide variety of careers such as engineering, law, medicine, computer science and information technology, optical and laser science and materials science. Many physicists work in government or industrial laboratories, but some start their own businesses. Here are examples of recent graduates'' employment:
Loan Advisor / NELNET
Process Engineer I / GARMIN
Research Assistant / UNIVERSITY OF NEBRASKA-LINCOLN
Science Teacher 9-12 / MILLARD PUBLIC SCHOOLS
Science Teacher / LINCOLN PUBLIC SCHOOLS
Software Developer Engineer / CSG INTERNATIONAL
Software Developer / APPLIED UNDERWRITERS
Systems Programmer / BRYAN HEALTH
Teaching Assistant / UNIVERSITY OF NEBRASKA-LINCOLN
', 10),
(43, 'Political Science', 'College of Arts and Sciences', 'Majoring in political science at Nebraska moves you to combine the analytical and communication skills of a liberal arts degree with an in-depth understanding of governments and political processes. You can also experience courses in different subfields of political science, which contribute to your overall knowledge of complex political relations and institutions:
American Government and Public Policy examines national, state and local government
Biology, Psychology and Politics explores the role of biology and psychology in people''s political attitudes and behaviors
Human Rights and Security examines the nexus between the search for security and the requirement for and establishment of robust humanitarian standards
International Relations and Comparative Politics addresses problems arising when nations interact and how countries other than the United States govern themselves
ExperienceIn the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in political science such as:
Studying abroad in Prague, Czech Republic
Serving as the Amnesty International Club president
Interning with a senator in the United States Senate or with Nebraskans for Civic Reform
Researching the relationship between political orientation, racial bias and moral foundations
Volunteering with Justice for Our Neighbors
', 'As a political science major you will be drawn to, and be successful in, a number of occupations and professions. Training in political science at Nebraska provides you with a capacity to gather information, sort through it, select that which is relevant and apply it in solving a specific problem. Here are examples of recent graduates'' employment:
Campaign Organizer / IMPACT ORGANIZATION/ENVIRONMENT NEW MEXICO
Civic Engagement and Organizing Coordinator / BORDER ACTION NETWORK
Deputy Data Director / DEMOCRAT PARTY OF VIRGINIA
Director of Voting Rights / NEBRASKANS FOR CIVIC REFORM
Economic Analyst / THE UNITED STATES GOVERNMENT
Editorial Board Intern / CHICAGO TRIBUNE
Financial Services Officer / SACS FEDERAL CREDIT UNION
Immigration Services Officer / THE DEPARTMENT OF HOME LAND SECURITY
Public Involvement Specialist / STATE OF NEBRASKA
Resource and Student Engagement Coordinator / NEBRASKA FAMILY ALLIANCE
', 'As a political science major you will be drawn to, and be successful in, a number of occupations and professions. Training in political science at Nebraska provides you with a capacity to gather information, sort through it, select that which is relevant and apply it in solving a specific problem. Here are examples of recent graduates'' employment:
Campaign Organizer / IMPACT ORGANIZATION/ENVIRONMENT NEW MEXICO
Civic Engagement and Organizing Coordinator / BORDER ACTION NETWORK
Deputy Data Director / DEMOCRAT PARTY OF VIRGINIA
Director of Voting Rights / NEBRASKANS FOR CIVIC REFORM
Economic Analyst / THE UNITED STATES GOVERNMENT
Editorial Board Intern / CHICAGO TRIBUNE
Financial Services Officer / SACS FEDERAL CREDIT UNION
Immigration Services Officer / THE DEPARTMENT OF HOME LAND SECURITY
Public Involvement Specialist / STATE OF NEBRASKA
Resource and Student Engagement Coordinator / NEBRASKA FAMILY ALLIANCE
', 10),
(44, 'Psychology', 'College of Arts and Sciences', 'When you major in psychology at Nebraska, you will explore and study behavior and psychological function in humans and animals along with the individual, social and biological factors that lead to normal and abnormal behavior. You will be exposed to many core areas of psychology and the option to pursue advanced coursework in areas that spark your interest.In addition to core requirements, you can elect to enroll in courses such as:
Aggression
Drugs and Behavior
Learning and Motivation
Psychology of Personality
Abnormal Psychology
Psychology and Law
Psychology of Racism
Health Psychology
Human Memory
Behavioral Neuroscience
Child Behavior and Development
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in psychology such as:
Studying abroad in the United Kingdom
Serving as the Undergraduate Psychology Organization president
Interning with Friendship Home as a Women''s Advocate
Researching the neuropsychology of concussions
Volunteering with CEDARS Youth Services
OpportunitiesWith a bachelor''s degree in psychology from the College of Arts and Sciences, you are prepared for entry-level careers in human services (outreach, advocacy, case manager, crisis worker), business (management, sales, public relations, human resources, research assistant), government (parole officer, employment specialist, foreign service officer, child protection worker), and education (teaching assistant, community health educator, college recruiter, after-school program coordinator). Here are examples of recent graduates'' employment:
Behavioral Health Technician / BOYS TOWN
Corrections Unit Caseworker / NEBRASKA DEPARTMENT OF CORRECTIONS
Director of Talent Sourcing / GALLUP
Enrollment Counselor / MOUNT MARY COLLEGE
Foster Care Family Support Services / LARIMER CENTER FOR MENTAL HEALTH
Neurobiology Research Assistant / BOYS TOWN NATIONAL RESEARCH HOSPITAL
Professional Services Consultant / CERNER CORPORATION
Reporter / CHICAGO TRIBUNE
Volunteer Coordinator / HOSPICE COMMUNITY CARE
Youth Specialist / CEDARS
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in psychology such as:
Studying abroad in the United Kingdom
Serving as the Undergraduate Psychology Organization president
Interning with Friendship Home as a Women''s Advocate
Researching the neuropsychology of concussions
Volunteering with CEDARS Youth Services
OpportunitiesWith a bachelor''s degree in psychology from the College of Arts and Sciences, you are prepared for entry-level careers in human services (outreach, advocacy, case manager, crisis worker), business (management, sales, public relations, human resources, research assistant), government (parole officer, employment specialist, foreign service officer, child protection worker), and education (teaching assistant, community health educator, college recruiter, after-school program coordinator). Here are examples of recent graduates'' employment:
Behavioral Health Technician / BOYS TOWN
Corrections Unit Caseworker / NEBRASKA DEPARTMENT OF CORRECTIONS
Director of Talent Sourcing / GALLUP
Enrollment Counselor / MOUNT MARY COLLEGE
Foster Care Family Support Services / LARIMER CENTER FOR MENTAL HEALTH
Neurobiology Research Assistant / BOYS TOWN NATIONAL RESEARCH HOSPITAL
Professional Services Consultant / CERNER CORPORATION
Reporter / CHICAGO TRIBUNE
Volunteer Coordinator / HOSPICE COMMUNITY CARE
Youth Specialist / CEDARS
', 10),
(45, 'Sports Media and Communication', 'College of Journalism and Mass Communications', 'From day one, you are offered hands-on opportunities to work in sports media and communication. The new major gives you the opportunity to pursue a career in sports without being a competitive athlete. You will get a strong foundation of sports knowledge and skills from different perspectives, including journalism, broadcasting, advertising, public relations, and marketing.', 'A degree in sports media and communication can take you anywhere you dream of going. The College of Journalism and Mass Communications has one of the highest job placement rates at UNL, and our graduates have found careers worldwide.Our graduates are employed as sports journalists, announcers, sports information professionals, sports marketers, sports event planners, sports community relations professionals, graphic and web designers, and sports media entrepreneurs.
ESPN
Nebraska Athletic Department
Omaha World-Herald
Archrival
Hudl
HUMANeX Ventures
FOX Sports
Seattle Mariners
Huskers Illustrated
Big Ten Network
KMTV
KETV
', 'Some agencies and organizations where our students have held internships include:
Job shadowing at Nebraska Football Spring Game
HuskerVision
Hudl
College World Series
Lincoln Saltdogs
KRNU
Fox Sports U
FACILITIESAndersen Hall, located on the revitalized Centennial Mall, is home to four floors of resources for students. CoJMC students are granted 24-hour access to the building, which has several computer labs with state-of-the-art computers updated to the most recent software programs, to work on assignments and meet for group projects.The building, which is within a few blocks of the historic state Capitol and Lincoln''s bustling downtown, boasts the following labs:
the KRNU station and several audio-recording rooms.
the newsroom, which includes a wall of TVs playing all the major news channels, computers with the most recent software and faculty offices around the room where faculty are available to help students.
the Maker Studio, where Makers Hours are held every Friday afternoon. Students are invited to come and experiment with tools and technology used to create 360 videos, operate drones and write cutting-edge code to develop engaging, interactive websites
the Bailey Lauerman Student Commons, where students can meet to work on campaigns as a group or just catch up in between classes.
renovated Presentation Room, each semester students present campaigns to local clients in this state-of-the-art presentation room.
renovated social and digital media hub in support of new visual communication program, including state-of-the-art social media lab and advanced Hootsuite partnership
renovated conference-style collaborative learning spaces with Smart TVs powered by AppleAirPlay
the Maker Studio, where Makers Hours are held every Friday afternoon. Students are invited to come in and experiment with tools and technology used to create 360 videos, operate drones and write cutting-edge code.
the newsroom, which includes a wall of TVs playing all the major news channels, computers with the most recent software and faculty offices around the room where faculty are available to help students
You may also have the opportunity to work at:
The Daily Nebraskan, which has offices in the Nebraska Union, is UNL''s independent student newspaper. Although it is not affiliated with the college, many of our students work in paid positions there in advertising or news
Jacht Club, the CoJMC''s student-run advertising agency, is located nearby in Lincoln''s historic Haymarket among several other top startups that make up Silicon Prairie. It includes a high-tech video-editing bay, space for brainstorming sessions and rooftop area for meetings that overlooks the historic Haymarket
RANKINGSWhile no official rankings exist for colleges of journalism and mass communications, we believe we''re among the nation''s best and so do others.
We were chosen to join a prestigious consortium of the country''s top 12 journalism programs - the Carnegie-Knight Initiative on the Future of Journalism Education.
The college is also 1 of only 7 chosen to host a residency for students who are part of the national Dow Jones News Fund editing internship program.
Judges of the Hearst Journalism Awards competition regularly find our students'' work to be among the best.
We are the only one of 112 accredited journalism programs this decade to produce a national champion in 3 of 4 Hearst categories – writing, broadcasting and photography.
We have become the team to beat in the district competition of the National Student Advertising Competition Team, having won it for 3 years in row. We placed 4th place in the nation in 2010 in the national competition where more than 150 schools compete.
Our students placed third nationally in PRSA''s prestigious Bateman competition, after only competing for three years.
In calling us a "national leader" in journalism education, a national accreditation report cited our "impressive programs and initiatives at local, state, national and global levels" and our ability "to stay on the cutting edge in journalism and mass communications."
Our students are selected for some of the most competitive and prestigious internships, including the:

	American Advertising Federation Vance Stickell Internship, McCann Erickson New York.
	Allan Rosenshine Minority Education and Training Fund, BBDO New York.
	American Association of Advertising Agencies Multicultural Agency Internship Program, Hill | Holiday Boston.


RESEARCH
John Schrader
Frauke Hachtmann
Rick Alloway
Bruce Thorson
  ', 10),
(46, 'Theatre (Design/Technical Production)', 'Hixson-Lied College of Fine and Performing Arts', 'This emphasis provides the motivated student with a broad general education as well as vigorous training in the areas of:
scenic
costume
sound
lighting design
technical production
The training you''ll receive in this program allows you to seek an entry-level position in:
professional theatre
television
film industries
OR, pursue further education at a graduate school or internship program
It is the goal of faculty to give the student the classroom instruction, practical experience and individual attention needed to form clear goals pertaining to a career in technical theatre.', 'Students are prepared to pursue careers in scenic, costume, sound, and lighting design in the theatre, television, or film industries.', '', 10),
(47, 'Veterinary Science', 'College of Agricultural Sciences and Natural Resources', 'The veterinary science program is designed for students interested in animal health and prepares students for a career in veterinary or biomedical science. Students can tailor the program to meet pre-veterinary medicine requirements for any accredited school or college of veterinary medicine in North America. The program can also position students to continue their education in graduate school as a masters or doctoral student.Career Opportunities
Veterinary medicine
Microbiology
Biomedical or veterinary research
Veterinary pharmaceutics
Animal production
Animal protection and conservation
Regulatory or governmental affairs
The Nebraska Difference
Learn about animal health and diseases from scientists and veterinarians studying and diagnosing animal diseases.
Learn about animals from animal scientists studying animal production and animal products.
Gain experience in veterinary and animal production research, veterinary diagnostic services and animal care as a student employee.
Socialize and learn from other students interested in veterinary or biomedical as a career.
', '', 'The veterinary science program is designed for students interested in animal health and prepares students for a career in veterinary or biomedical science. Students can tailor the program to meet pre-veterinary medicine requirements for any accredited school or college of veterinary medicine in North America. The program can also position students to continue their education in graduate school as a masters or doctoral student.Career Opportunities
Veterinary medicine
Microbiology
Biomedical or veterinary research
Veterinary pharmaceutics
Animal production
Animal protection and conservation
Regulatory or governmental affairs
The Nebraska Difference
Learn about animal health and diseases from scientists and veterinarians studying and diagnosing animal diseases.
Learn about animals from animal scientists studying animal production and animal products.
Gain experience in veterinary and animal production research, veterinary diagnostic services and animal care as a student employee.
Socialize and learn from other students interested in veterinary or biomedical as a career.
', 10),
(48, 'Women''s and Gender Studies', 'College of Arts and Sciences', 'Women''s and gender studies will move you to an interdisciplinary program devoted to the study of women, gender and sexuality. You will investigate the lives of women as writers and scholars, artists and activists, public figures and private citizens, in the past and the present. You will also study gender more broadly, which means you will look at feminine, masculine and queer identities across time and cultures in order to understand how gender signifies relationships of power.Your core classes will include the Introduction to Women''s and Gender Studies; Feminist Theories, Feminists'' Perspectives; and a Senior Seminar. In addition, you can take courses like:
Gender and Communication
Women in Popular Culture
Philosophy of Feminism
Psychology of Gender
Women in Contemporary Society
', 'In the College of Arts and Sciences, we know experience is valuable and goes beyond the classroom. We strive to help you connect your academics with research, internships, education abroad, service learning and leadership experiences. Take advantage of opportunities in women''s and gender studies such as:
Studying abroad in Greece
Serving in the university''s Women''s Center
Interning with Planned Parenthood of the Heartland
Researching domestic violence in literature
Leading peers as the president of Students Advocating Gender Equity (SAGE) student organization
', 'Your women''s and gender studies major provides valuable interdisciplinary training, appealing to employers and higher education programs alike. With coursework and experiences such as working for human rights and justice, traveling abroad to gain new perspectives, or taking advantage of an internship in any number of industries, you will be prepared for anything. You could pursue a position as a counselor, social worker, health care professional, editor or teacher. You could also pursue graduate programs in a variety of disciplines or obtain a law or medical degree. Here are examples of recent graduates'' employment:
Case Manager / CENTER POINTE
Editor / UNIVERSITY OF NEBRASKA-LINCOLN
Field Director / KILEY FOR KIDS
Mentor for the Highly Gifted / LINCOLN PUBLIC SCHOOLS
Office Associate / UNIVERSITY HEALTH CENTER COUNSELING
Peace Corps Volunteer / PEACE CORPS
Program Specialist / GIRL SCOUTS
Rural Advocate / VOICES OF HOPE
Specialist/Textbooks Associate / NEBRASKA BOOKSTORE
', 10);

INSERT INTO questions (id, `text`) VALUES
(1, 'I need the freedom to be creative and express myself.'),
(2, 'I enjoy theatre arts, either performing as an actor or working behind the scenes on a production.'),
(3, 'I like to give advice.'),
(4, 'I am interested in rehabilitating and healing people.'),
(5, 'I am very ambitious, persuasive and love coming up with new ideas.'),
(6, 'I care about the state of the environment and want to help improve it in my career.'),
(7, 'I enjoy learning about different parts of the world.'),
(8, 'I like math and figuring out how things work.'),
(9, 'I''m interested in graphic design and/or web design.'),
(10, 'I''m interested in technology and learning how computers work.'),
(11, 'I enjoy learning about the human body and the natural world.'),
(12, 'I like to work with my hands.'),
(13, 'I have a strong interest and ability in visual arts.'),
(14, 'I work well with others, and I have strong written and verbal communication skills.'),
(15, 'I''m good with numbers and am detail-oriented.'),
(16, 'I''m interested in law, debate, government and politics.'),
(17, 'I would like to work with conflict resolution, mediation or criminal justice.'),
(18, 'I am always reading a book or writing my own stories.'),
(19, 'I like to experiment with better and faster ways of doing things.'),
(20, 'I am patient and enjoy working with children.'),
(21, 'I''m interested in science, and I want to help people.'),
(22, 'I love learning new languages.'),
(23, 'I enjoy helping people.'),
(24, 'I want to work with people who have been oppressed or on the margins of society.'),
(25, 'I''m interested in a wide range of subjects and careers.'),
(26, 'I''m interested in intellectual ideas and philosophy.'),
(27, 'I like to sing and/or play musical instruments.'),
(28, 'I''m good at organizing and like to be in charge.');

INSERT INTO question_weights (question_id, major_id, weight) VALUES
(1, 1, 0),
(1, 2, 3),
(1, 3, 0),
(1, 4, 0),
(1, 5, 2),
(1, 6, 3),
(1, 7, 0),
(1, 8, 0),
(1, 9, 0),
(1, 10, 0),
(1, 11, 0),
(1, 12, 0),
(1, 13, 0),
(1, 14, 0),
(1, 15, 0),
(1, 16, 0),
(1, 17, 0),
(1, 18, 0),
(1, 19, 0),
(1, 20, 0),
(1, 21, 3),
(1, 22, 0),
(1, 23, 0),
(1, 24, 0),
(1, 25, 0),
(1, 26, 0),
(1, 27, 0),
(1, 28, 0),
(1, 29, 0),
(1, 30, 0),
(1, 31, 2),
(1, 32, 0),
(1, 33, 0),
(1, 34, 2),
(1, 35, 0),
(1, 36, 0),
(1, 37, 0),
(1, 38, 0),
(1, 39, 3),
(1, 40, 0),
(1, 41, 0),
(1, 42, 0),
(1, 43, 0),
(1, 44, 0),
(1, 45, 0),
(1, 46, 2),
(1, 47, 0),
(1, 48, 0),
(2, 1, 0),
(2, 2, 3),
(2, 3, 0),
(2, 4, 0),
(2, 5, 0),
(2, 6, 1),
(2, 7, 0),
(2, 8, 0),
(2, 9, 0),
(2, 10, 0),
(2, 11, 0),
(2, 12, 0),
(2, 13, 0),
(2, 14, 0),
(2, 15, 0),
(2, 16, 0),
(2, 17, 0),
(2, 18, 0),
(2, 19, 0),
(2, 20, 0),
(2, 21, 1),
(2, 22, 0),
(2, 23, 0),
(2, 24, 0),
(2, 25, 0),
(2, 26, 0),
(2, 27, 0),
(2, 28, 0),
(2, 29, 0),
(2, 30, 0),
(2, 31, 0),
(2, 32, 0),
(2, 33, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 37, 0),
(2, 38, 0),
(2, 39, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(2, 43, 0),
(2, 44, 0),
(2, 45, 0),
(2, 46, 3),
(2, 47, 0),
(2, 48, 0),
(3, 1, 0),
(3, 2, 0),
(3, 3, 2),
(3, 4, 0),
(3, 5, 0),
(3, 6, 0),
(3, 7, 0),
(3, 8, 0),
(3, 9, 0),
(3, 10, 1),
(3, 11, 2),
(3, 12, 0),
(3, 13, 0),
(3, 14, 2),
(3, 15, 0),
(3, 16, 0),
(3, 17, 0),
(3, 18, 0),
(3, 19, 0),
(3, 20, 0),
(3, 21, 0),
(3, 22, 0),
(3, 23, 0),
(3, 24, 0),
(3, 25, 0),
(3, 26, 0),
(3, 27, 0),
(3, 28, 0),
(3, 29, 0),
(3, 30, 0),
(3, 31, 0),
(3, 32, 0),
(3, 33, 0),
(3, 34, 3),
(3, 35, 1),
(3, 36, 0),
(3, 37, 0),
(3, 38, 0),
(3, 39, 0),
(3, 40, 0),
(3, 41, 0),
(3, 42, 0),
(3, 43, 0),
(3, 44, 3),
(3, 45, 1),
(3, 46, 0),
(3, 47, 0),
(3, 48, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(4, 5, 0),
(4, 6, 0),
(4, 7, 2),
(4, 8, 3),
(4, 9, 3),
(4, 10, 0),
(4, 11, 0),
(4, 12, 0),
(4, 13, 0),
(4, 14, 2),
(4, 15, 0),
(4, 16, 0),
(4, 17, 0),
(4, 18, 0),
(4, 19, 0),
(4, 20, 2),
(4, 21, 0),
(4, 22, 0),
(4, 23, 0),
(4, 24, 0),
(4, 25, 0),
(4, 26, 0),
(4, 27, 0),
(4, 28, 0),
(4, 29, 0),
(4, 30, 0),
(4, 31, 0),
(4, 32, 0),
(4, 33, 0),
(4, 34, 0),
(4, 35, 0),
(4, 36, 0),
(4, 37, 0),
(4, 38, 0),
(4, 39, 0),
(4, 40, 1),
(4, 41, 0),
(4, 42, 0),
(4, 43, 0),
(4, 44, 3),
(4, 45, 0),
(4, 46, 0),
(4, 47, 2),
(4, 48, 0),
(5, 1, 0),
(5, 2, 0),
(5, 3, 0),
(5, 4, 0),
(5, 5, 2),
(5, 6, 0),
(5, 7, 0),
(5, 8, 0),
(5, 9, 0),
(5, 10, 0),
(5, 11, 2),
(5, 12, 0),
(5, 13, 0),
(5, 14, 0),
(5, 15, 0),
(5, 16, 0),
(5, 17, 0),
(5, 18, 0),
(5, 19, 2),
(5, 20, 0),
(5, 21, 0),
(5, 22, 0),
(5, 23, 0),
(5, 24, 2),
(5, 25, 0),
(5, 26, 0),
(5, 27, 0),
(5, 28, 0),
(5, 29, 0),
(5, 30, 0),
(5, 31, 0),
(5, 32, 0),
(5, 33, 0),
(5, 34, 2),
(5, 35, 3),
(5, 36, 0),
(5, 37, 0),
(5, 38, 0),
(5, 39, 0),
(5, 40, 0),
(5, 41, 3),
(5, 42, 0),
(5, 43, 0),
(5, 44, 0),
(5, 45, 0),
(5, 46, 0),
(5, 47, 0),
(5, 48, 0),
(6, 1, 0),
(6, 2, 0),
(6, 3, 0),
(6, 4, 0),
(6, 5, 0),
(6, 6, 0),
(6, 7, 2),
(6, 8, 2),
(6, 9, 0),
(6, 10, 0),
(6, 11, 0),
(6, 12, 0),
(6, 13, 1),
(6, 14, 0),
(6, 15, 0),
(6, 16, 0),
(6, 17, 0),
(6, 18, 0),
(6, 19, 0),
(6, 20, 0),
(6, 21, 0),
(6, 22, 0),
(6, 23, 0),
(6, 24, 0),
(6, 25, 3),
(6, 26, 0),
(6, 27, 3),
(6, 28, 1),
(6, 29, 0),
(6, 30, 0),
(6, 31, 0),
(6, 32, 0),
(6, 33, 0),
(6, 34, 0),
(6, 35, 0),
(6, 36, 0),
(6, 37, 0),
(6, 38, 3),
(6, 39, 0),
(6, 40, 0),
(6, 41, 0),
(6, 42, 0),
(6, 43, 0),
(6, 44, 0),
(6, 45, 0),
(6, 46, 0),
(6, 47, 0),
(6, 48, 0),
(7, 1, 0),
(7, 2, 0),
(7, 3, 0),
(7, 4, 3),
(7, 5, 2),
(7, 6, 1),
(7, 7, 0),
(7, 8, 0),
(7, 9, 0),
(7, 10, 0),
(7, 11, 0),
(7, 12, 0),
(7, 13, 0),
(7, 14, 0),
(7, 15, 0),
(7, 16, 0),
(7, 17, 0),
(7, 18, 0),
(7, 19, 0),
(7, 20, 0),
(7, 21, 0),
(7, 22, 0),
(7, 23, 0),
(7, 24, 0),
(7, 25, 0),
(7, 26, 0),
(7, 27, 0),
(7, 28, 0),
(7, 29, 0),
(7, 30, 3),
(7, 31, 0),
(7, 32, 3),
(7, 33, 0),
(7, 34, 0),
(7, 35, 0),
(7, 36, 0),
(7, 37, 0),
(7, 38, 0),
(7, 39, 0),
(7, 40, 0),
(7, 41, 0),
(7, 42, 0),
(7, 43, 0),
(7, 44, 0),
(7, 45, 0),
(7, 46, 0),
(7, 47, 0),
(7, 48, 1),
(8, 1, 2),
(8, 2, 0),
(8, 3, 2),
(8, 4, 0),
(8, 5, 1),
(8, 6, 0),
(8, 7, 1),
(8, 8, 0),
(8, 9, 2),
(8, 10, 0),
(8, 11, 0),
(8, 12, 2),
(8, 13, 1),
(8, 14, 0),
(8, 15, 2),
(8, 16, 0),
(8, 17, 2),
(8, 18, 2),
(8, 19, 0),
(8, 20, 0),
(8, 21, 0),
(8, 22, 0),
(8, 23, 2),
(8, 24, 0),
(8, 25, 0),
(8, 26, 0),
(8, 27, 0),
(8, 28, 1),
(8, 29, 1),
(8, 30, 0),
(8, 31, 0),
(8, 32, 0),
(8, 33, 0),
(8, 34, 0),
(8, 35, 0),
(8, 36, 3),
(8, 37, 2),
(8, 38, 0),
(8, 39, 0),
(8, 40, 0),
(8, 41, 0),
(8, 42, 3),
(8, 43, 0),
(8, 44, 0),
(8, 45, 0),
(8, 46, 0),
(8, 47, 0),
(8, 48, 0),
(9, 1, 0),
(9, 2, 0),
(9, 3, 0),
(9, 4, 0),
(9, 5, 0),
(9, 6, 1),
(9, 7, 0),
(9, 8, 0),
(9, 9, 0),
(9, 10, 0),
(9, 11, 0),
(9, 12, 0),
(9, 13, 0),
(9, 14, 0),
(9, 15, 0),
(9, 16, 0),
(9, 17, 0),
(9, 18, 3),
(9, 19, 0),
(9, 20, 0),
(9, 21, 0),
(9, 22, 0),
(9, 23, 0),
(9, 24, 0),
(9, 25, 0),
(9, 26, 0),
(9, 27, 0),
(9, 28, 0),
(9, 29, 0),
(9, 30, 0),
(9, 31, 3),
(9, 32, 0),
(9, 33, 0),
(9, 34, 0),
(9, 35, 0),
(9, 36, 0),
(9, 37, 0),
(9, 38, 0),
(9, 39, 0),
(9, 40, 0),
(9, 41, 0),
(9, 42, 0),
(9, 43, 0),
(9, 44, 0),
(9, 45, 0),
(9, 46, 0),
(9, 47, 0),
(9, 48, 0),
(10, 1, 0),
(10, 2, 0),
(10, 3, 0),
(10, 4, 0),
(10, 5, 0),
(10, 6, 0),
(10, 7, 0),
(10, 8, 0),
(10, 9, 0),
(10, 10, 0),
(10, 11, 0),
(10, 12, 0),
(10, 13, 0),
(10, 14, 0),
(10, 15, 0),
(10, 16, 0),
(10, 17, 3),
(10, 18, 3),
(10, 19, 0),
(10, 20, 0),
(10, 21, 0),
(10, 22, 0),
(10, 23, 3),
(10, 24, 0),
(10, 25, 0),
(10, 26, 0),
(10, 27, 0),
(10, 28, 0),
(10, 29, 0),
(10, 30, 0),
(10, 31, 0),
(10, 32, 0),
(10, 33, 0),
(10, 34, 0),
(10, 35, 0),
(10, 36, 0),
(10, 37, 0),
(10, 38, 0),
(10, 39, 0),
(10, 40, 0),
(10, 41, 0),
(10, 42, 0),
(10, 43, 0),
(10, 44, 0),
(10, 45, 0),
(10, 46, 0),
(10, 47, 0),
(10, 48, 0),
(11, 1, 0),
(11, 2, 0),
(11, 3, 0),
(11, 4, 1),
(11, 5, 0),
(11, 6, 0),
(11, 7, 2),
(11, 8, 3),
(11, 9, 1),
(11, 10, 0),
(11, 11, 0),
(11, 12, 0),
(11, 13, 2),
(11, 14, 0),
(11, 15, 0),
(11, 16, 0),
(11, 17, 0),
(11, 18, 0),
(11, 19, 0),
(11, 20, 0),
(11, 21, 0),
(11, 22, 0),
(11, 23, 0),
(11, 24, 0),
(11, 25, 2),
(11, 26, 0),
(11, 27, 0),
(11, 28, 1),
(11, 29, 0),
(11, 30, 0),
(11, 31, 0),
(11, 32, 0),
(11, 33, 0),
(11, 34, 0),
(11, 35, 0),
(11, 36, 0),
(11, 37, 0),
(11, 38, 0),
(11, 39, 0),
(11, 40, 3),
(11, 41, 0),
(11, 42, 0),
(11, 43, 0),
(11, 44, 0),
(11, 45, 0),
(11, 46, 0),
(11, 47, 1),
(11, 48, 0),
(12, 1, 0),
(12, 2, 0),
(12, 3, 0),
(12, 4, 0),
(12, 5, 0),
(12, 6, 2),
(12, 7, 0),
(12, 8, 0),
(12, 9, 0),
(12, 10, 0),
(12, 11, 0),
(12, 12, 0),
(12, 13, 0),
(12, 14, 1),
(12, 15, 0),
(12, 16, 0),
(12, 17, 0),
(12, 18, 0),
(12, 19, 0),
(12, 20, 0),
(12, 21, 0),
(12, 22, 0),
(12, 23, 0),
(12, 24, 0),
(12, 25, 0),
(12, 26, 0),
(12, 27, 1),
(12, 28, 0),
(12, 29, 1),
(12, 30, 2),
(12, 31, 0),
(12, 32, 0),
(12, 33, 0),
(12, 34, 0),
(12, 35, 0),
(12, 36, 0),
(12, 37, 2),
(12, 38, 0),
(12, 39, 1),
(12, 40, 0),
(12, 41, 0),
(12, 42, 0),
(12, 43, 0),
(12, 44, 0),
(12, 45, 0),
(12, 46, 2),
(12, 47, 2),
(12, 48, 0),
(13, 1, 0),
(13, 2, 0),
(13, 3, 0),
(13, 4, 0),
(13, 5, 1),
(13, 6, 3),
(13, 7, 0),
(13, 8, 0),
(13, 9, 0),
(13, 10, 0),
(13, 11, 0),
(13, 12, 0),
(13, 13, 0),
(13, 14, 0),
(13, 15, 0),
(13, 16, 0),
(13, 17, 0),
(13, 18, 0),
(13, 19, 0),
(13, 20, 0),
(13, 21, 0),
(13, 22, 0),
(13, 23, 0),
(13, 24, 0),
(13, 25, 0),
(13, 26, 0),
(13, 27, 0),
(13, 28, 0),
(13, 29, 0),
(13, 30, 0),
(13, 31, 0),
(13, 32, 0),
(13, 33, 0),
(13, 34, 0),
(13, 35, 0),
(13, 36, 0),
(13, 37, 0),
(13, 38, 0),
(13, 39, 0),
(13, 40, 0),
(13, 41, 0),
(13, 42, 0),
(13, 43, 0),
(13, 44, 0),
(13, 45, 0),
(13, 46, 0),
(13, 47, 0),
(13, 48, 0),
(14, 1, 0),
(14, 2, 0),
(14, 3, 0),
(14, 4, 0),
(14, 5, 0),
(14, 6, 0),
(14, 7, 0),
(14, 8, 0),
(14, 9, 0),
(14, 10, 2),
(14, 11, 1),
(14, 12, 0),
(14, 13, 0),
(14, 14, 1),
(14, 15, 0),
(14, 16, 1),
(14, 17, 0),
(14, 18, 0),
(14, 19, 2),
(14, 20, 0),
(14, 21, 0),
(14, 22, 0),
(14, 23, 0),
(14, 24, 1),
(14, 25, 0),
(14, 26, 0),
(14, 27, 0),
(14, 28, 0),
(14, 29, 0),
(14, 30, 0),
(14, 31, 0),
(14, 32, 0),
(14, 33, 0),
(14, 34, 0),
(14, 35, 3),
(14, 36, 0),
(14, 37, 0),
(14, 38, 0),
(14, 39, 0),
(14, 40, 0),
(14, 41, 0),
(14, 42, 0),
(14, 43, 0),
(14, 44, 0),
(14, 45, 2),
(14, 46, 0),
(14, 47, 0),
(14, 48, 0),
(15, 1, 3),
(15, 2, 0),
(15, 3, 3),
(15, 4, 0),
(15, 5, 1),
(15, 6, 0),
(15, 7, 2),
(15, 8, 0),
(15, 9, 3),
(15, 10, 0),
(15, 11, 0),
(15, 12, 3),
(15, 13, 1),
(15, 14, 0),
(15, 15, 0),
(15, 16, 0),
(15, 17, 3),
(15, 18, 3),
(15, 19, 2),
(15, 20, 0),
(15, 21, 0),
(15, 22, 0),
(15, 23, 3),
(15, 24, 0),
(15, 25, 0),
(15, 26, 2),
(15, 27, 0),
(15, 28, 0),
(15, 29, 2),
(15, 30, 0),
(15, 31, 0),
(15, 32, 0),
(15, 33, 0),
(15, 34, 0),
(15, 35, 0),
(15, 36, 2),
(15, 37, 3),
(15, 38, 0),
(15, 39, 0),
(15, 40, 0),
(15, 41, 0),
(15, 42, 2),
(15, 43, 0),
(15, 44, 0),
(15, 45, 0),
(15, 46, 0),
(15, 47, 1),
(15, 48, 0),
(16, 1, 0),
(16, 2, 0),
(16, 3, 0),
(16, 4, 0),
(16, 5, 0),
(16, 6, 0),
(16, 7, 0),
(16, 8, 0),
(16, 9, 0),
(16, 10, 0),
(16, 11, 0),
(16, 12, 0),
(16, 13, 0),
(16, 14, 0),
(16, 15, 0),
(16, 16, 0),
(16, 17, 0),
(16, 18, 0),
(16, 19, 0),
(16, 20, 3),
(16, 21, 0),
(16, 22, 1),
(16, 23, 0),
(16, 24, 0),
(16, 25, 0),
(16, 26, 0),
(16, 27, 0),
(16, 28, 0),
(16, 29, 0),
(16, 30, 0),
(16, 31, 0),
(16, 32, 0),
(16, 33, 0),
(16, 34, 2),
(16, 35, 0),
(16, 36, 0),
(16, 37, 0),
(16, 38, 0),
(16, 39, 0),
(16, 40, 0),
(16, 41, 3),
(16, 42, 0),
(16, 43, 3),
(16, 44, 0),
(16, 45, 0),
(16, 46, 0),
(16, 47, 0),
(16, 48, 1),
(17, 1, 0),
(17, 2, 0),
(17, 3, 0),
(17, 4, 0),
(17, 5, 0),
(17, 6, 0),
(17, 7, 0),
(17, 8, 0),
(17, 9, 0),
(17, 10, 0),
(17, 11, 0),
(17, 12, 0),
(17, 13, 0),
(17, 14, 2),
(17, 15, 0),
(17, 16, 2),
(17, 17, 0),
(17, 18, 0),
(17, 19, 0),
(17, 20, 3),
(17, 21, 0),
(17, 22, 0),
(17, 23, 0),
(17, 24, 0),
(17, 25, 0),
(17, 26, 0),
(17, 27, 0),
(17, 28, 0),
(17, 29, 0),
(17, 30, 0),
(17, 31, 0),
(17, 32, 0),
(17, 33, 0),
(17, 34, 0),
(17, 35, 0),
(17, 36, 0),
(17, 37, 0),
(17, 38, 0),
(17, 39, 0),
(17, 40, 0),
(17, 41, 0),
(17, 42, 0),
(17, 43, 0),
(17, 44, 2),
(17, 45, 0),
(17, 46, 0),
(17, 47, 0),
(17, 48, 0),
(18, 1, 0),
(18, 2, 0),
(18, 3, 0),
(18, 4, 0),
(18, 5, 0),
(18, 6, 0),
(18, 7, 0),
(18, 8, 0),
(18, 9, 0),
(18, 10, 0),
(18, 11, 0),
(18, 12, 0),
(18, 13, 0),
(18, 14, 0),
(18, 15, 0),
(18, 16, 0),
(18, 17, 0),
(18, 18, 0),
(18, 19, 0),
(18, 20, 0),
(18, 21, 0),
(18, 22, 0),
(18, 23, 0),
(18, 24, 3),
(18, 25, 0),
(18, 26, 0),
(18, 27, 0),
(18, 28, 0),
(18, 29, 0),
(18, 30, 0),
(18, 31, 0),
(18, 32, 0),
(18, 33, 0),
(18, 34, 2),
(18, 35, 0),
(18, 36, 0),
(18, 37, 0),
(18, 38, 0),
(18, 39, 0),
(18, 40, 0),
(18, 41, 0),
(18, 42, 0),
(18, 43, 0),
(18, 44, 0),
(18, 45, 0),
(18, 46, 0),
(18, 47, 0),
(18, 48, 0),
(19, 1, 0),
(19, 2, 0),
(19, 3, 0),
(19, 4, 0),
(19, 5, 0),
(19, 6, 0),
(19, 7, 0),
(19, 8, 0),
(19, 9, 0),
(19, 10, 0),
(19, 11, 0),
(19, 12, 0),
(19, 13, 0),
(19, 14, 0),
(19, 15, 0),
(19, 16, 0),
(19, 17, 0),
(19, 18, 2),
(19, 19, 0),
(19, 20, 0),
(19, 21, 0),
(19, 22, 0),
(19, 23, 0),
(19, 24, 0),
(19, 25, 0),
(19, 26, 0),
(19, 27, 0),
(19, 28, 2),
(19, 29, 0),
(19, 30, 0),
(19, 31, 0),
(19, 32, 0),
(19, 33, 0),
(19, 34, 0),
(19, 35, 0),
(19, 36, 0),
(19, 37, 0),
(19, 38, 0),
(19, 39, 0),
(19, 40, 0),
(19, 41, 0),
(19, 42, 0),
(19, 43, 0),
(19, 44, 0),
(19, 45, 0),
(19, 46, 0),
(19, 47, 0),
(19, 48, 0),
(20, 1, 0),
(20, 2, 0),
(20, 3, 0),
(20, 4, 0),
(20, 5, 0),
(20, 6, 0),
(20, 7, 0),
(20, 8, 0),
(20, 9, 0),
(20, 10, 0),
(20, 11, 0),
(20, 12, 0),
(20, 13, 0),
(20, 14, 3),
(20, 15, 0),
(20, 16, 0),
(20, 17, 0),
(20, 18, 0),
(20, 19, 0),
(20, 20, 0),
(20, 21, 0),
(20, 22, 0),
(20, 23, 0),
(20, 24, 0),
(20, 25, 0),
(20, 26, 0),
(20, 27, 0),
(20, 28, 0),
(20, 29, 0),
(20, 30, 0),
(20, 31, 0),
(20, 32, 0),
(20, 33, 0),
(20, 34, 0),
(20, 35, 0),
(20, 36, 0),
(20, 37, 0),
(20, 38, 0),
(20, 39, 0),
(20, 40, 1),
(20, 41, 0),
(20, 42, 0),
(20, 43, 0),
(20, 44, 1),
(20, 45, 0),
(20, 46, 0),
(20, 47, 0),
(20, 48, 0),
(21, 1, 0),
(21, 2, 0),
(21, 3, 0),
(21, 4, 0),
(21, 5, 0),
(21, 6, 0),
(21, 7, 2),
(21, 8, 2),
(21, 9, 2),
(21, 10, 0),
(21, 11, 0),
(21, 12, 0),
(21, 13, 2),
(21, 14, 0),
(21, 15, 0),
(21, 16, 0),
(21, 17, 0),
(21, 18, 0),
(21, 19, 0),
(21, 20, 0),
(21, 21, 0),
(21, 22, 0),
(21, 23, 0),
(21, 24, 0),
(21, 25, 0),
(21, 26, 0),
(21, 27, 0),
(21, 28, 2),
(21, 29, 0),
(21, 30, 0),
(21, 31, 0),
(21, 32, 0),
(21, 33, 0),
(21, 34, 0),
(21, 35, 0),
(21, 36, 0),
(21, 37, 0),
(21, 38, 0),
(21, 39, 0),
(21, 40, 2),
(21, 41, 0),
(21, 42, 0),
(21, 43, 0),
(21, 44, 2),
(21, 45, 0),
(21, 46, 0),
(21, 47, 2),
(21, 48, 0),
(22, 1, 0),
(22, 2, 0),
(22, 3, 0),
(22, 4, 2),
(22, 5, 0),
(22, 6, 0),
(22, 7, 0),
(22, 8, 0),
(22, 9, 0),
(22, 10, 0),
(22, 11, 0),
(22, 12, 0),
(22, 13, 0),
(22, 14, 0),
(22, 15, 0),
(22, 16, 1),
(22, 17, 0),
(22, 18, 0),
(22, 19, 0),
(22, 20, 0),
(22, 21, 0),
(22, 22, 0),
(22, 23, 0),
(22, 24, 0),
(22, 25, 0),
(22, 26, 0),
(22, 27, 0),
(22, 28, 0),
(22, 29, 0),
(22, 30, 0),
(22, 31, 0),
(22, 32, 2),
(22, 33, 0),
(22, 34, 0),
(22, 35, 0),
(22, 36, 0),
(22, 37, 0),
(22, 38, 0),
(22, 39, 0),
(22, 40, 0),
(22, 41, 0),
(22, 42, 0),
(22, 43, 0),
(22, 44, 0),
(22, 45, 0),
(22, 46, 0),
(22, 47, 0),
(22, 48, 0),
(23, 1, 0),
(23, 2, 0),
(23, 3, 0),
(23, 4, 0),
(23, 5, 0),
(23, 6, 0),
(23, 7, 0),
(23, 8, 1),
(23, 9, 0),
(23, 10, 0),
(23, 11, 0),
(23, 12, 0),
(23, 13, 0),
(23, 14, 2),
(23, 15, 0),
(23, 16, 0),
(23, 17, 0),
(23, 18, 0),
(23, 19, 0),
(23, 20, 1),
(23, 21, 0),
(23, 22, 0),
(23, 23, 0),
(23, 24, 0),
(23, 25, 0),
(23, 26, 0),
(23, 27, 0),
(23, 28, 0),
(23, 29, 0),
(23, 30, 0),
(23, 31, 0),
(23, 32, 0),
(23, 33, 1),
(23, 34, 1),
(23, 35, 0),
(23, 36, 0),
(23, 37, 0),
(23, 38, 0),
(23, 39, 0),
(23, 40, 2),
(23, 41, 0),
(23, 42, 0),
(23, 43, 0),
(23, 44, 1),
(23, 45, 0),
(23, 46, 0),
(23, 47, 1),
(23, 48, 0),
(24, 1, 0),
(24, 2, 0),
(24, 3, 0),
(24, 4, 0),
(24, 5, 0),
(24, 6, 0),
(24, 7, 0),
(24, 8, 0),
(24, 9, 0),
(24, 10, 0),
(24, 11, 0),
(24, 12, 0),
(24, 13, 0),
(24, 14, 2),
(24, 15, 0),
(24, 16, 0),
(24, 17, 0),
(24, 18, 0),
(24, 19, 0),
(24, 20, 0),
(24, 21, 0),
(24, 22, 0),
(24, 23, 0),
(24, 24, 0),
(24, 25, 0),
(24, 26, 0),
(24, 27, 0),
(24, 28, 0),
(24, 29, 0),
(24, 30, 0),
(24, 31, 0),
(24, 32, 0),
(24, 33, 0),
(24, 34, 0),
(24, 35, 0),
(24, 36, 0),
(24, 37, 0),
(24, 38, 0),
(24, 39, 0),
(24, 40, 0),
(24, 41, 0),
(24, 42, 0),
(24, 43, 0),
(24, 44, 1),
(24, 45, 0),
(24, 46, 0),
(24, 47, 0),
(24, 48, 2),
(25, 1, 1),
(25, 2, 1),
(25, 3, 1),
(25, 4, 1),
(25, 5, 1),
(25, 6, 1),
(25, 7, 1),
(25, 8, 1),
(25, 9, 1),
(25, 10, 1),
(25, 11, 1),
(25, 12, 1),
(25, 13, 1),
(25, 14, 1),
(25, 15, 1),
(25, 16, 1),
(25, 17, 1),
(25, 18, 1),
(25, 19, 1),
(25, 20, 1),
(25, 21, 1),
(25, 22, 1),
(25, 23, 1),
(25, 24, 1),
(25, 25, 1),
(25, 26, 1),
(25, 27, 1),
(25, 28, 1),
(25, 29, 1),
(25, 30, 1),
(25, 31, 1),
(25, 32, 1),
(25, 33, 1),
(25, 34, 1),
(25, 35, 1),
(25, 36, 1),
(25, 37, 1),
(25, 38, 1),
(25, 39, 1),
(25, 40, 1),
(25, 41, 1),
(25, 42, 1),
(25, 43, 1),
(25, 44, 1),
(25, 45, 1),
(25, 46, 1),
(25, 47, 1),
(25, 48, 1),
(26, 1, 0),
(26, 2, 0),
(26, 3, 0),
(26, 4, 0),
(26, 5, 0),
(26, 6, 0),
(26, 7, 0),
(26, 8, 0),
(26, 9, 0),
(26, 10, 0),
(26, 11, 0),
(26, 12, 0),
(26, 13, 0),
(26, 14, 0),
(26, 15, 0),
(26, 16, 0),
(26, 17, 0),
(26, 18, 0),
(26, 19, 0),
(26, 20, 0),
(26, 21, 0),
(26, 22, 0),
(26, 23, 0),
(26, 24, 0),
(26, 25, 0),
(26, 26, 0),
(26, 27, 0),
(26, 28, 0),
(26, 29, 0),
(26, 30, 0),
(26, 31, 0),
(26, 32, 0),
(26, 33, 0),
(26, 34, 0),
(26, 35, 0),
(26, 36, 0),
(26, 37, 0),
(26, 38, 0),
(26, 39, 0),
(26, 40, 0),
(26, 41, 3),
(26, 42, 0),
(26, 43, 1),
(26, 44, 0),
(26, 45, 0),
(26, 46, 0),
(26, 47, 0),
(26, 48, 0),
(27, 1, 0),
(27, 2, 0),
(27, 3, 0),
(27, 4, 0),
(27, 5, 0),
(27, 6, 0),
(27, 7, 0),
(27, 8, 0),
(27, 9, 0),
(27, 10, 0),
(27, 11, 0),
(27, 12, 0),
(27, 13, 0),
(27, 14, 0),
(27, 15, 0),
(27, 16, 0),
(27, 17, 0),
(27, 18, 0),
(27, 19, 0),
(27, 20, 0),
(27, 21, 0),
(27, 22, 0),
(27, 23, 0),
(27, 24, 0),
(27, 25, 0),
(27, 26, 0),
(27, 27, 0),
(27, 28, 0),
(27, 29, 0),
(27, 30, 0),
(27, 31, 0),
(27, 32, 0),
(27, 33, 0),
(27, 34, 0),
(27, 35, 0),
(27, 36, 0),
(27, 37, 0),
(27, 38, 0),
(27, 39, 3),
(27, 40, 0),
(27, 41, 0),
(27, 42, 0),
(27, 43, 0),
(27, 44, 0),
(27, 45, 0),
(27, 46, 0),
(27, 47, 0),
(27, 48, 0),
(28, 1, 0),
(28, 2, 0),
(28, 3, 0),
(28, 4, 0),
(28, 5, 0),
(28, 6, 0),
(28, 7, 0),
(28, 8, 0),
(28, 9, 0),
(28, 10, 0),
(28, 11, 0),
(28, 12, 0),
(28, 13, 0),
(28, 14, 0),
(28, 15, 0),
(28, 16, 0),
(28, 17, 0),
(28, 18, 0),
(28, 19, 3),
(28, 20, 0),
(28, 21, 0),
(28, 22, 0),
(28, 23, 0),
(28, 24, 0),
(28, 25, 0),
(28, 26, 0),
(28, 27, 0),
(28, 28, 0),
(28, 29, 0),
(28, 30, 0),
(28, 31, 0),
(28, 32, 0),
(28, 33, 3),
(28, 34, 0),
(28, 35, 0),
(28, 36, 0),
(28, 37, 0),
(28, 38, 0),
(28, 39, 0),
(28, 40, 0),
(28, 41, 0),
(28, 42, 0),
(28, 43, 0),
(28, 44, 0),
(28, 45, 0),
(28, 46, 0),
(28, 47, 0),
(28, 48, 0);

-- Backend (FastAPI) connection user
-- IMPORTANT: replace 'change_this_password' with a real password before using in production.
-- Drop the user first if it already exists, then recreate it.


CREATE USER IF NOT EXISTS 'backend'@'localhost'
  IDENTIFIED BY 'Bingsan1358!';

-- Grant only read/write privileges (no DROP, no GRANT) to the application user
GRANT ALL PRIVILEGES
ON major_chooser.* 
TO 'backend'@'localhost';

FLUSH PRIVILEGES;
