package models

// Code generated by github.com/tinylib/msgp DO NOT EDIT.

import (
	"github.com/tinylib/msgp/msgp"
)

// DecodeMsg implements msgp.Decodable
func (z *FlacData) DecodeMsg(dc *msgp.Reader) (err error) {
	var field []byte
	_ = field
	var zb0001 uint32
	zb0001, err = dc.ReadMapHeader()
	if err != nil {
		err = msgp.WrapError(err)
		return
	}
	for zb0001 > 0 {
		zb0001--
		field, err = dc.ReadMapKeyPtr()
		if err != nil {
			err = msgp.WrapError(err)
			return
		}
		switch msgp.UnsafeString(field) {
		case "OriginPath":
			z.OriginPath, err = dc.ReadString()
			if err != nil {
				err = msgp.WrapError(err, "OriginPath")
				return
			}
		case "ReplacementStart":
			z.ReplacementStart, err = dc.ReadInt64()
			if err != nil {
				err = msgp.WrapError(err, "ReplacementStart")
				return
			}
		case "ReplacementEnd":
			z.ReplacementEnd, err = dc.ReadInt64()
			if err != nil {
				err = msgp.WrapError(err, "ReplacementEnd")
				return
			}
		case "MetaBlock":
			z.MetaBlock, err = dc.ReadBytes(z.MetaBlock)
			if err != nil {
				err = msgp.WrapError(err, "MetaBlock")
				return
			}
		case "Size":
			z.Size, err = dc.ReadUint64()
			if err != nil {
				err = msgp.WrapError(err, "Size")
				return
			}
		case "CTime":
			z.CTime, err = dc.ReadTime()
			if err != nil {
				err = msgp.WrapError(err, "CTime")
				return
			}
		case "MTime":
			z.MTime, err = dc.ReadTime()
			if err != nil {
				err = msgp.WrapError(err, "MTime")
				return
			}
		default:
			err = dc.Skip()
			if err != nil {
				err = msgp.WrapError(err)
				return
			}
		}
	}
	return
}

// EncodeMsg implements msgp.Encodable
func (z *FlacData) EncodeMsg(en *msgp.Writer) (err error) {
	// map header, size 7
	// write "OriginPath"
	err = en.Append(0x87, 0xaa, 0x4f, 0x72, 0x69, 0x67, 0x69, 0x6e, 0x50, 0x61, 0x74, 0x68)
	if err != nil {
		return
	}
	err = en.WriteString(z.OriginPath)
	if err != nil {
		err = msgp.WrapError(err, "OriginPath")
		return
	}
	// write "ReplacementStart"
	err = en.Append(0xb0, 0x52, 0x65, 0x70, 0x6c, 0x61, 0x63, 0x65, 0x6d, 0x65, 0x6e, 0x74, 0x53, 0x74, 0x61, 0x72, 0x74)
	if err != nil {
		return
	}
	err = en.WriteInt64(z.ReplacementStart)
	if err != nil {
		err = msgp.WrapError(err, "ReplacementStart")
		return
	}
	// write "ReplacementEnd"
	err = en.Append(0xae, 0x52, 0x65, 0x70, 0x6c, 0x61, 0x63, 0x65, 0x6d, 0x65, 0x6e, 0x74, 0x45, 0x6e, 0x64)
	if err != nil {
		return
	}
	err = en.WriteInt64(z.ReplacementEnd)
	if err != nil {
		err = msgp.WrapError(err, "ReplacementEnd")
		return
	}
	// write "MetaBlock"
	err = en.Append(0xa9, 0x4d, 0x65, 0x74, 0x61, 0x42, 0x6c, 0x6f, 0x63, 0x6b)
	if err != nil {
		return
	}
	err = en.WriteBytes(z.MetaBlock)
	if err != nil {
		err = msgp.WrapError(err, "MetaBlock")
		return
	}
	// write "Size"
	err = en.Append(0xa4, 0x53, 0x69, 0x7a, 0x65)
	if err != nil {
		return
	}
	err = en.WriteUint64(z.Size)
	if err != nil {
		err = msgp.WrapError(err, "Size")
		return
	}
	// write "CTime"
	err = en.Append(0xa5, 0x43, 0x54, 0x69, 0x6d, 0x65)
	if err != nil {
		return
	}
	err = en.WriteTime(z.CTime)
	if err != nil {
		err = msgp.WrapError(err, "CTime")
		return
	}
	// write "MTime"
	err = en.Append(0xa5, 0x4d, 0x54, 0x69, 0x6d, 0x65)
	if err != nil {
		return
	}
	err = en.WriteTime(z.MTime)
	if err != nil {
		err = msgp.WrapError(err, "MTime")
		return
	}
	return
}

// MarshalMsg implements msgp.Marshaler
func (z *FlacData) MarshalMsg(b []byte) (o []byte, err error) {
	o = msgp.Require(b, z.Msgsize())
	// map header, size 7
	// string "OriginPath"
	o = append(o, 0x87, 0xaa, 0x4f, 0x72, 0x69, 0x67, 0x69, 0x6e, 0x50, 0x61, 0x74, 0x68)
	o = msgp.AppendString(o, z.OriginPath)
	// string "ReplacementStart"
	o = append(o, 0xb0, 0x52, 0x65, 0x70, 0x6c, 0x61, 0x63, 0x65, 0x6d, 0x65, 0x6e, 0x74, 0x53, 0x74, 0x61, 0x72, 0x74)
	o = msgp.AppendInt64(o, z.ReplacementStart)
	// string "ReplacementEnd"
	o = append(o, 0xae, 0x52, 0x65, 0x70, 0x6c, 0x61, 0x63, 0x65, 0x6d, 0x65, 0x6e, 0x74, 0x45, 0x6e, 0x64)
	o = msgp.AppendInt64(o, z.ReplacementEnd)
	// string "MetaBlock"
	o = append(o, 0xa9, 0x4d, 0x65, 0x74, 0x61, 0x42, 0x6c, 0x6f, 0x63, 0x6b)
	o = msgp.AppendBytes(o, z.MetaBlock)
	// string "Size"
	o = append(o, 0xa4, 0x53, 0x69, 0x7a, 0x65)
	o = msgp.AppendUint64(o, z.Size)
	// string "CTime"
	o = append(o, 0xa5, 0x43, 0x54, 0x69, 0x6d, 0x65)
	o = msgp.AppendTime(o, z.CTime)
	// string "MTime"
	o = append(o, 0xa5, 0x4d, 0x54, 0x69, 0x6d, 0x65)
	o = msgp.AppendTime(o, z.MTime)
	return
}

// UnmarshalMsg implements msgp.Unmarshaler
func (z *FlacData) UnmarshalMsg(bts []byte) (o []byte, err error) {
	var field []byte
	_ = field
	var zb0001 uint32
	zb0001, bts, err = msgp.ReadMapHeaderBytes(bts)
	if err != nil {
		err = msgp.WrapError(err)
		return
	}
	for zb0001 > 0 {
		zb0001--
		field, bts, err = msgp.ReadMapKeyZC(bts)
		if err != nil {
			err = msgp.WrapError(err)
			return
		}
		switch msgp.UnsafeString(field) {
		case "OriginPath":
			z.OriginPath, bts, err = msgp.ReadStringBytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "OriginPath")
				return
			}
		case "ReplacementStart":
			z.ReplacementStart, bts, err = msgp.ReadInt64Bytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "ReplacementStart")
				return
			}
		case "ReplacementEnd":
			z.ReplacementEnd, bts, err = msgp.ReadInt64Bytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "ReplacementEnd")
				return
			}
		case "MetaBlock":
			z.MetaBlock, bts, err = msgp.ReadBytesBytes(bts, z.MetaBlock)
			if err != nil {
				err = msgp.WrapError(err, "MetaBlock")
				return
			}
		case "Size":
			z.Size, bts, err = msgp.ReadUint64Bytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "Size")
				return
			}
		case "CTime":
			z.CTime, bts, err = msgp.ReadTimeBytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "CTime")
				return
			}
		case "MTime":
			z.MTime, bts, err = msgp.ReadTimeBytes(bts)
			if err != nil {
				err = msgp.WrapError(err, "MTime")
				return
			}
		default:
			bts, err = msgp.Skip(bts)
			if err != nil {
				err = msgp.WrapError(err)
				return
			}
		}
	}
	o = bts
	return
}

// Msgsize returns an upper bound estimate of the number of bytes occupied by the serialized message
func (z *FlacData) Msgsize() (s int) {
	s = 1 + 11 + msgp.StringPrefixSize + len(z.OriginPath) + 17 + msgp.Int64Size + 15 + msgp.Int64Size + 10 + msgp.BytesPrefixSize + len(z.MetaBlock) + 5 + msgp.Uint64Size + 6 + msgp.TimeSize + 6 + msgp.TimeSize
	return
}
