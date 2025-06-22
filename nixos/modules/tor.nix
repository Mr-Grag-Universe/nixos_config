{
	services.tor = {
		enable = false;
		openFirewall = true;
		enableGeoIP = false;

		torsocks.enable = true;
		client.enable = true;

		# relay = {
		# 	enable = true;
		# 	role = "relay";
		# };
		settings = {
			UseBridges = true;
			# ContactInfo = "toradmin@example.org";
			# Nickname = "toradmin";
			# ORPort = 9001;
			# ControlPort = 9051;
			# BandWidthRate = "1 MBytes";
		};
	};
}
