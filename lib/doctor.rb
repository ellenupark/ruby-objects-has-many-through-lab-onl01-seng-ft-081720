class Doctor
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select {|appointment| appointment.doctor == self}
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end

    def patients
        doctor_appointments = Appointment.all.select {|appointment| appointment.doctor == self}
        doctor_appointments.map {|appointment| appointment.patient}
    end
end