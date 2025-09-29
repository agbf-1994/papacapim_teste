
bool senhaIgual(String sa, String sb)
{
  if(sa==sb) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}

bool senhaIdeal(String sa, String sb)
{
  int ext=10;
  if(senhaIgual(sa, sb))
  {
    if((sa.length >= ext) && (sa.length==sb.length))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  else
  {
    return false;
  }
}

bool senhaLoginIdeal(String sa)
{
  int ext=10;
  if(sa.length>=ext)
  {
    return true;
  }
  else
  {
    return false;
  }
}

bool loginUserVazio(String? lg)
{
  if((lg==null) || (lg==""))
  {
    return true;
  }
  else
  {
    return false;
  }
}