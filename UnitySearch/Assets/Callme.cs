using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using NCMB;

public class Callme : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void searchIN_press()
    {
        NCMBQuery<NCMBObject> query = new NCMBQuery<NCMBObject>("SearchClass");
        List<string> conditions = new List<string>();
        conditions.Add("name5");
        conditions.Add("name2");
        query.WhereContainedIn("name", conditions);
        query.FindAsync((List<NCMBObject> objList, NCMBException e) =>
        {
            if (e != null)
            {
                Debug.Log("Error: " + e.ErrorMessage);
            }
            else
            {
                //Debug.Log("Json: " + JsonConvert.SerializeObject(objList));
                foreach (NCMBObject obj in objList)
                {
                    string uotput = "|";
                    uotput += obj.ObjectId + "|";
                    ICollection<string> keys = obj.Keys;
                    IDictionary<string, object> serverData = obj.serverData;
                    ArrayList name = (ArrayList)serverData["name"];
                    foreach(string s in name)
                    {
                        uotput += s + ",";
                    }
                    uotput += "|";
                    uotput += obj.CreateDate.ToString() + "|";
                    uotput += obj.UpdateDate.ToString() + "|";

                    Debug.Log("Object:" + uotput);
                }
            }
        });

    }
    public void searchIN_ARRAY_press()
    {
        NCMBQuery<NCMBObject> query = new NCMBQuery<NCMBObject>("SearchClass");
        List<string> conditions = new List<string>();
        conditions.Add("name5");
        conditions.Add("name2");
        query.WhereContainedInArray("name", conditions);
        query.FindAsync((List<NCMBObject> objList, NCMBException e) =>
        {
            if (e != null)
            {
                Debug.Log("Error: " + e.ErrorMessage);
            }
            else
            {
                string reu = JsonUtility.ToJson(objList);
                //Debug.Log("Json: " + JsonConvert.SerializeObject(objList));
                foreach (NCMBObject obj in objList)
                {
                    string uotput = "|";
                    uotput += obj.ObjectId + "|";
                    ICollection<string> keys = obj.Keys;
                    IDictionary<string, object> serverData = obj.serverData;
                    ArrayList name = (ArrayList)serverData["name"];
                    foreach (string s in name)
                    {
                        uotput += s + ",";
                    }
                    uotput += "|";
                    uotput += obj.CreateDate.ToString() + "|";
                    uotput += obj.UpdateDate.ToString() + "|";

                    Debug.Log("Object:" + uotput);
                }
            }
        });
    }
}
