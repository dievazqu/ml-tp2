function e_4
	load fisheriris;
	e_4regtree(meas(:,3:4), species)
	e_4regtree(meas(:,1:2), species)
	e_4regtree(meas, species)
	
	show_plots
end

function show_plots()
	load fisheriris;
	figure;

	gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
	xlabel('Largo del sepalo [cm]');
	ylabel('Ancho del sepalo [cm]');

	figure;
	gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
	xlabel('Largo del petalo [cm]');
	ylabel('Ancho del petalo [cm]');
	
end
