INSERT INTO `accounts` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police Department', 1),
	('society_offpolice', 'Police Department', 1)
;

INSERT INTO `datastores` (`name`, `label`, `shared`) VALUES
	('society_police', 'Police Department', 1),
	('society_offpolice', 'Police Department', 1)
;

INSERT INTO `jobs` (`name`, `label`) VALUES
	('police', 'Police Department'),
    ('offpolice', 'Police Department')
;

INSERT INTO `jobgrades` (`jobName`, `grade`, `name`, `label`, `salary`) VALUES
	('police', 0, 'recruit', 'Recruit', 500),
	('police', 1, 'officer', 'Officer', 600),
	('police', 2, 'sergeant', 'Sergeant', 700),
	('police', 3, 'lieutenant', 'Lieutenant', 850),
	('police', 4, 'boss', 'Chief', 1000),
    ('offpolice', 0, 'recruit', 'Recruit', 350),
	('offpolice', 1, 'officer', 'Officer', 350),
	('offpolice', 2, 'sergeant', 'Sergeant', 350),
	('offpolice', 3, 'lieutenant', 'Lieutenant', 350),
	('offpolice', 4, 'boss', 'Chief', 350)
;

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `canRemove`) VALUES 
   ('handcuffs', 'Handcuffs', 1, 0, 1)
;

CREATE TABLE `fines` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`label` VARCHAR(255) DEFAULT NULL,
	`amount` INT DEFAULT NULL,
	`category` INT DEFAULT NULL,

	PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;


INSERT INTO `fines` (`label`, `amount`, `category`) VALUES
	('Misuse of a horn', 30, 0),
	('Illegally Crossing a continuous Line', 40, 0),
	('Driving on the wrong side of the road', 250, 0),
	('Illegal U-Turn', 250, 0),
	('Illegally Driving Off-road', 170, 0),
	('Refusing a Lawful Command', 30, 0),
	('Illegally Stopping a Vehicle', 150, 0),
	('Illegal Parking', 70, 0),
	('Failing to Yield to the right', 70, 0),
	('Failure to comply with Vehicle Information', 90, 0),
	('Failing to stop at a Stop Sign ', 105, 0),
	('Failing to stop at a Red Light', 130, 0),
	('Illegal Passing', 100, 0),
	('Driving an illegal Vehicle', 100, 0),
	('Driving without a License', 1500, 0),
	('Hit and Run', 800, 0),
	('Exceeding Speeds Over < 5 mph', 90, 0),
	('Exceeding Speeds Over 5-15 mph', 120, 0),
	('Exceeding Speeds Over 15-30 mph', 180, 0),
	('Exceeding Speeds Over > 30 mph', 300, 0),
	('Impeding traffic flow', 110, 1),
	('Public Intoxication', 90, 1),
	('Disorderly conduct', 90, 1),
	('Obstruction of Justice', 130, 1),
	('Insults towards Civilans', 75, 1),
	('Disrespecting of an LEO', 110, 1),
	('Verbal Threat towards a Civilan', 90, 1),
	('Verbal Threat towards an LEO', 150, 1),
	('Providing False Information', 250, 1),
	('Attempt of Corruption', 1500, 1),
	('Brandishing a weapon in city Limits', 120, 2),
	('Brandishing a Lethal Weapon in city Limits', 300, 2),
	('No Firearms License', 600, 2),
	('Possession of an Illegal Weapon', 700, 2),
	('Possession of Burglary Tools', 300, 2),
	('Grand Theft Auto', 1800, 2),
	('Intent to Sell/Distrube of an illegal Substance', 1500, 2),
	('Frabrication of an Illegal Substance', 1500, 2),
	('Possession of an Illegal Substance ', 650, 2),
	('Kidnapping of a Civilan', 1500, 2),
	('Kidnapping of an LEO', 2000, 2),
	('Robbery', 650, 2),
	('Armed Robbery of a Store', 650, 2),
	('Armed Robbery of a Bank', 1500, 2),
	('Assault on a Civilian', 2000, 3),
	('Assault of an LEO', 2500, 3),
	('Attempt of Murder of a Civilian', 3000, 3),
	('Attempt of Murder of an LEO', 5000, 3),
	('Murder of a Civilian', 10000, 3),
	('Murder of an LEO', 30000, 3),
	('Involuntary manslaughter', 1800, 3),
	('Fraud', 2000, 2)
;