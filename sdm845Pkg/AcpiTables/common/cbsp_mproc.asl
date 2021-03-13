//
// Core-BSP MPROC Drivers (IPC Router & GLINK)
//

//
// IPC Router
//
Device (IPC0)
{
	Name (_DEP, Package(0x1)
	{
		\_SB_.GLNK
	})
	Name (_HID, "QCOM021C")
	Alias(\_SB.PSUB, _SUB)
}

//
// GLINK
//
// Order of incoming and outgoing interrupts depend on the number of interrupts mentioned in INTR method 
Device (GLNK)
{
	Name (_DEP, Package(0x1)
	{
		\_SB_.RPEN
	})
  Name (_HID, "QCOM02F9")
  Alias(\_SB.PSUB, _SUB)
	Name (_UID, 0)

  Method (_CRS, 0x0, NotSerialized) {
	Name (RBUF, ResourceTemplate ()
		{

		// Inbound SMP2P interrupt from Modem (SYS_apssQgicSPI(451)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {483}

		// Inbound SMP2P interrupt from ADSP (SYS_apssQgicSPI[158]):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {190}

		// Inbound SMP2P interrupt from SSC (SYS_apssQgicSPI(172)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {204}

		// Inbound SMP2P interrupt from CDSP (SYS_apssQgicSPI(576)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {608}

		// Inbound SMEM XPORT interrupt from Modem (SYS_apssQgicSPI(449)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {481}

		// Inbound SMEM XPORT interrupt from ADSP (SYS_apssQgicSPI[156]):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {188}

		// Inbound SMEM XPORT interrupt from SSC (SYS_apssQgicSPI(170)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {202}

		// Inbound SMEM XPORT interrupt from CDSP (SYS_apssQgicSPI(574)):
		Interrupt(ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {606}

		})
	Return (RBUF)
  }

}
